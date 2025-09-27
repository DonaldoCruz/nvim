return {
	{
		"nvim-mini/mini.nvim",
		version = false,
	},
	{
		"nvim-mini/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({
				symbol = "|",
				try_as_border = true,
			})
		end,
		version = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
}
