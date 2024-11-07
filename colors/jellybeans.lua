-- " You probably always want to set this in your vim file
vim.opt.background = "dark"
vim.g.colors_name = "jellybeans"

local lush = require("lush")
local jellybeans = require("lush_theme.jellybeans")

-- "bold | italic | nil"
local defaults = {
	include = "bold",
	comments = "italic",
	functions = "NONE",
	strings = "NONE",
	variables = "NONE",
}

local set_style = function (opt, opt_lit)
  if opt == nil then
    return "NONE"
  end

  return opt or defaults[opt_lit]
end

local spec = lush.extends({ jellybeans }).with(function(config)
	return {
		Include { fg = jellybeans.Include.fg, gui = set_style(config.functions, "functions") },
		Comment { fg = jellybeans.Comment.fg, gui = set_style(config.comments, "comments") },
		Function { fg = jellybeans.Function.fg, gui = set_style(config.functions, "functions") },
    String { fg = jellybeans.String.fg, gui = set_style(config.strings, "strings") },
    TSVariable { fg = jellybeans.TSVariable.fg, bg = jellybeans.TSVariable.bg, gui = set_style(config.variables, "variables") }
	}
end)
-- package.loaded["lush_theme.jellybeans"] = nil
--
-- require("lush")(require("lush_theme.jellybeans"))

lush(spec)
