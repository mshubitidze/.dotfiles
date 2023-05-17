local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	-- b.formatting.deno_fmt, -- faster, but prefer prettier

	b.formatting.prettier,

	-- python
	b.formatting.black,
	b.diagnostics.flake8,

	-- Lua
	b.formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
