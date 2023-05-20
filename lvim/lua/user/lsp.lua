-- add to skipped
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

-- remove from skipped
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "eslint"
end, lvim.lsp.automatic_configuration.skipped_servers)
