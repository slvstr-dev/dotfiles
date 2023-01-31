local M = {}

function M.on_attach(client, buffer)
  local self = M.new(client, buffer)

  self:map("<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
  self:map("<leader>cl", "LspInfo", { desc = "Lsp info" })
  self:map("<leader>xd", "Telescope diagnostics", { desc = "Telescope diagnostics" })
  self:map("gd", "Telescope lsp_definitions", { desc = "Goto definition" })
  self:map("gr", "Telescope lsp_references", { desc = "References" })
  self:map("gD", "vim.lsp.buf.declaration", { desc = "Goto declaration" })
  self:map("gI", "Telescope lsp_implementations", { desc = "Goto implementation" })
  self:map("gt", "Telescope lsp_type_definitions", { desc = "Goto type definition" })
  self:map("K", vim.lsp.buf.hover, { desc = "Hover" })
  self:map("gK", vim.lsp.buf.signature_help, { desc = "Signature help", has = "signatureHelp" })
  self:map("<c-k>", vim.lsp.buf.signature_help, { mode = "i", desc = "Signature help", has = "signatureHelp" })
  self:map("]d", M.diagnostic_goto(true), { desc = "Next diagnostic" })
  self:map("[d", M.diagnostic_goto(false), { desc = "Prev diagnostic" })
  self:map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next error" })
  self:map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev error" })
  self:map("]w", M.diagnostic_goto(true, "WARNING"), { desc = "Next warning" })
  self:map("[w", M.diagnostic_goto(false, "WARNING"), { desc = "Prev warning" })
  self:map("<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", mode = { "n", "v" }, has = "codeAction" })

  local format = require("plugins.lsp.format").format
  self:map("<leader>cf", format, { desc = "Format document", has = "documentFormatting" })
  self:map("<leader>cf", format, { desc = "Format range", mode = "v", has = "documentRangeFormatting" })
  self:map("<leader>cr", M.rename, { expr = true, desc = "Rename", has = "rename" })
end

function M.new(client, buffer)
  return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
  return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
  opts = opts or {}
  if opts.has and not self:has(opts.has) then
    return
  end
  vim.keymap.set(
    opts.mode or "n",
    lhs,
    type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
    ---@diagnostic disable-next-line: no-unknown
    { silent = true, buffer = self.buffer, expr = opts.expr, desc = opts.desc }
  )
end

function M.rename()
  if pcall(require, "inc_rename") then
    return ":IncRename " .. vim.fn.expand("<cword>")
  else
    vim.lsp.buf.rename()
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
