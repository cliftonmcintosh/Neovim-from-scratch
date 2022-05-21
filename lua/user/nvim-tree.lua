-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

vim.g["nvim_tree_git_hl"] = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g["nvim_tree_highlight_opened_files"] = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g["nvim_tree_root_folder_modifier"] = ':t' --This is the default. See :help filename-modifiers for more options
vim.g["nvim_tree_group_empty"] = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g["nvim_tree_symlink_arrow"] = ' >> ' -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g["nvim_tree_respect_buf_cwd"] = 1 --0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g["nvim_tree_create_in_closed_folder"] = 1 --0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g["nvim_tree_special_files"] = { ["README.md"] = 1, Makefile = 1, MAKEFILE = 1 } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g["nvim_tree_quit_on_open"] = 0
vim.g["nvim_tree_disable_window_picker"] = 0
vim.g["nvim_tree_show_icons"] = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    }

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    }
  },
}
