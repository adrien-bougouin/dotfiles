local build_colors = function()
  local colors = {
    Black   = 0, BrightBlack   = 8,
    Red     = 1, BrightRed     = 9,
    Green   = 2, BrightGreen   = 10,
    Yellow  = 3, BrightYellow  = 11,
    Blue    = 4, BrightBlue    = 12,
    Magenta = 5, BrightMagenta = 13,
    Cyan    = 6, BrightCyan    = 14,
    White   = 7, BrightWhite   = 15
  }

  if vim.o.background == "light" then
    colors.Background          = colors.BrightWhite
    -- Use the terminal foreground, instead of assuming a black (for instance
    -- Solarized does not use a black for normal text color).
    -- colors.Foreground       = "fg"
    colors.HighlightBackground = colors.White
    colors.HighlightForeground = colors.BrightBlack
  else
    colors.Background          = colors.BrightBlack
    -- Use the terminal foreground, instead of assuming a white (for instance
    -- Solarized does not use a white for normal text color).
    -- colors.Foreground       = "fg"
    colors.HighlightBackground = colors.Black
    colors.HighlightForeground = colors.White
  end

  return colors
end

local setup_highlight_groups = function(colors)
  local highlight_groups = {}

  local highligh_modules = { "base" }

  for _, module_name in pairs(highligh_modules) do
    local module = require(string.format("colorscheme.%s", module_name))

    for highlight_group, settings in pairs(module.setup(colors)) do
      highlight_groups[highlight_group] = settings
    end
  end

  return highlight_groups
end

return {
  setup = function(theme_name)
    vim.g.colors_name = theme_name

    vim.cmd.highlight("clear")

    local colors = build_colors()
    local highlight_groups = setup_highlight_groups(colors)

    for highlight_group, settings in pairs(highlight_groups) do
      vim.api.nvim_set_hl(0, highlight_group, settings)
    end
  end
}
