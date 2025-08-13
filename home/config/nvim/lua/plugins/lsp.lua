return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	config = function()
		vim.diagnostic.config({ virtual_text = true })
		require("lspconfig").lua_ls.setup {}
		require("lspconfig").rust_analyzer.setup {}
		require("lspconfig").pyright.setup {}
	end,
}
