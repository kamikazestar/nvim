return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			auto_install = true,
			sync_install = false,
			ignore_install = { 'javascript' },
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 *1024 -- 100KB
					local ok, status = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and status and status.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
