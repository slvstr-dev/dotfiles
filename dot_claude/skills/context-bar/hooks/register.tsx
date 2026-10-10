import { atom, read, update } from "claude-code";
import type { EngineInterface, Register, SessionContextBreakdown } from "claude-code";

import type { Reading, Slice } from "../types";

const MIN_WIDTH = 20;
const SPLIT = "   ";
const ACCENT = "#d97757";
const GREY = "#808080";
const PALETTE = [
  "#7aa2f7",
  "#7dcfff",
  "#bb9af7",
  "#9ece6a",
  "#e0af68",
  "#f7768e",
  "#73daca",
  "#ff9e64",
  "#c0caf5",
];
const KINDS = ["used", "free", "buffer"];
const BAR = { used: "█", free: "─", buffer: "░" };
const MARKER = { ...BAR, used: "■" };

const reading = atom({ plugin: "context-bar", key: "reading" } as const, null as Reading | null);

const ignore = () => {};

export const register: Register = (on) => {
  on("session.start", async ($, e, next) => {
    const result = await next(e);
    let tries = 0;
    const retry = $.clock.every(500, () => {
      void refresh($)
        .then((ok) => {
          if (ok || ++tries >= 20) retry.cancel();
        })
        .catch(ignore);
    });
    return result;
  });

  on("tool.call", async ($, e, next) => {
    const result = await next(e);
    if (!e.agentId) void refresh($).catch(ignore);
    return result;
  });

  on("turn.complete", async ($, e, next) => {
    const result = await next(e);
    if (!e.agentId) await refresh($).catch(ignore);
    return result;
  });

  on("session.compact", async ($, e, next) => {
    const result = await next(e);
    if (!e.agentId && "messages" in result) void refresh($).catch(ignore);
    return result;
  });

  on("ui.render", { component: "AbovePrompt" }, async ($, e, next) => {
    const rest = await next(e);
    const r = await read($, reading);
    const width = e.props.bodyColumns - 4;
    if (!r || e.props.hasSurvey || width < MIN_WIDTH) return rest;

    const { Box, Text } = $.ui.resolve(e);
    const fill = r.total / (r.compactsAt || r.window);
    const head = `${tokens(r.total)} of ${tokens(r.window)}${r.compactsAt ? ` · compacts at ${tokens(r.compactsAt)}` : ""} `;
    return (
      <Box flexDirection="column">
        <Box flexDirection="column" borderStyle="round" borderColor="inactive" paddingX={1}>
          <Box flexDirection="row" justifyContent="space-between">
            <Text wrap="truncate-end">
              <Text color={ACCENT}>{"◆ "}</Text>
              <Text bold>context</Text>
            </Text>
            <Text wrap="truncate-start">
              <Text dimColor>{head}</Text>
              <Text
                bold
                color="black"
                backgroundColor={fill >= 0.9 ? "red" : fill >= 0.7 ? "yellow" : "green"}
              >{` ${r.percent}% `}</Text>
            </Text>
          </Box>
          <Text>
            {bar(r, width).map((run) => (
              <Text color={run.color}>{BAR[run.kind].repeat(run.size)}</Text>
            ))}
          </Text>
          {legend(r, width).map((line) => (
            <Text wrap="truncate-end">
              {line.map((s, i) => (
                <Text>
                  {i > 0 && <Text>{SPLIT}</Text>}
                  <Text color={s.color}>{`${MARKER[s.kind]} `}</Text>
                  <Text dimColor={s.kind !== "used"}>{`${s.name} `}</Text>
                  <Text bold={s.kind === "used"}>{tokens(s.tokens)}</Text>
                  {s.kind === "used" && <Text dimColor>{` ${share(s.tokens, r.window)}`}</Text>}
                </Text>
              ))}
            </Text>
          ))}
        </Box>
        {rest}
      </Box>
    );
  });
};

async function refresh($: EngineInterface) {
  const { breakdown } = (await $.session.usage({ breakdown: "summary" })).context;
  if (!breakdown || !(breakdown.rawMaxTokens > 0)) return false;
  await update($, reading, () => toReading(breakdown));
  return true;
}

function toReading(b: SessionContextBreakdown): Reading {
  let color = 0;
  const slices = b.categories
    .filter((c) => c.kind !== "deferred" && c.tokens > 0)
    .sort((x, y) => KINDS.indexOf(x.kind) - KINDS.indexOf(y.kind))
    .map((c) => ({
      name: c.name.toLowerCase(),
      tokens: c.tokens,
      color:
        c.kind !== "used"
          ? GREY
          : c.name.toLowerCase() === "messages"
            ? ACCENT
            : PALETTE[color++ % PALETTE.length]!,
      kind: c.kind as Slice["kind"],
    }));
  return {
    slices,
    total: b.totalTokens,
    window: b.rawMaxTokens,
    percent: b.percentage,
    compactsAt: b.isAutoCompactEnabled ? b.autoCompactThreshold : undefined,
  };
}

function bar(r: Reading, width: number) {
  const runs = r.slices.map((s) => {
    const min = s.kind === "used" ? 1 : 0;
    return { ...s, min, size: Math.max(min, Math.round((s.tokens / r.window) * width)) };
  });
  let diff = width - runs.reduce((sum, run) => sum + run.size, 0);
  for (const run of [...runs].sort((a, b) => a.min - b.min || b.size - a.size)) {
    const size = Math.max(run.min, run.size + diff);
    diff -= size - run.size;
    run.size = size;
  }
  return runs.filter((run) => run.size > 0);
}

function legend(r: Reading, width: number) {
  const lines: Slice[][] = [];
  let used = 0;
  for (const s of r.slices) {
    const size = label(s, r.window).length;
    const line = lines.at(-1);
    if (line && used + SPLIT.length + size <= width) {
      line.push(s);
      used += SPLIT.length + size;
    } else {
      lines.push([s]);
      used = size;
    }
  }
  return lines;
}

function label(s: Slice, window: number) {
  return `${MARKER[s.kind]} ${s.name} ${tokens(s.tokens)}${s.kind === "used" ? ` ${share(s.tokens, window)}` : ""}`;
}

function tokens(n: number) {
  if (n >= 1_000_000) return `${+(n / 1_000_000).toFixed(1)}M`;
  if (n >= 10_000) return `${Math.round(n / 1000)}k`;
  if (n >= 1000) return `${+(n / 1000).toFixed(1)}k`;
  return String(n);
}

function share(n: number, window: number) {
  const p = (n / window) * 100;
  if (p > 0 && p < 0.1) return "<0.1%";
  return `${p >= 10 ? Math.round(p) : +p.toFixed(1)}%`;
}
