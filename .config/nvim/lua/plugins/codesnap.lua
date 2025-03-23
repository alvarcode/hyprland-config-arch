return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		require("codesnap").setup({
			code_font_family = "ComicShannsMono Nerd Font",
			bg_theme = "grape",
			bg_padding = 24,
		})
	end
}
