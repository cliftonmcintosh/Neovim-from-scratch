local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
	debug = false,
	sources = {
    code_actions.eslint,
    diagnostics.credo,
    diagnostics.eslint,
		formatting.black.with({ extra_args = { "--fast" } }),
    formatting.mix,
		formatting.prettier.with({ extra_args = { "--single-quote" } }),
		formatting.stylua,
    -- diagnostics.flake8
	},
})
