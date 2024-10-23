require("tokyonight").setup({
	style = "night",
	light_style = "night",
	styles = {
		keywords = {
			italic = false,
		},
		functions = {
			italic = false,
		},
	},
  on_highlights = function(highlights, _)
    local git_add_color = "#16f543"
    local git_delete_color = "#fc3714"
    local git_change_color = "#701efc"

    highlights.GitGutterAdd = {
      fg = git_add_color
    }

    highlights.GitGutterAddLineNr = {
      fg = git_add_color
    }

    highlights.GitSignsAdd = {
      fg = git_add_color
    }

    highlights.GitGutterDelete = {
      fg = git_delete_color
    }

    highlights.GitGutterDeleteLineNr = {
      fg = git_delete_color
    }

    highlights.GitSignsDelete = {
      fg = git_delete_color
    }

    highlights.GitGutterChange = {
      fg = git_change_color
    }

    highlights.GitGutterChangeLineNr = {
      fg = git_change_color
    }

    highlights.GitSignsChange = {
      fg = git_change_color
    }
  end
})

vim.cmd("colorscheme tokyonight")
