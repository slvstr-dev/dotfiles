export type Slice = {
  name: string;
  tokens: number;
  color: string;
  kind: "used" | "free" | "buffer";
};

export type Reading = {
  slices: Slice[];
  total: number;
  window: number;
  percent: number;
  compactsAt?: number;
};

declare module "claude-code" {
  interface PluginState {
    "context-bar": { reading: Reading | null };
  }
}
