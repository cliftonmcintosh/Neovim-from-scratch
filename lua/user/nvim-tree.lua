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
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true,
      }
    }
  },
  create_in_closed_folder = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  disable_netrw = true,
  filters = {
    custom = {},
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  hijack_cursor = false,
  hijack_directories = {
    auto_open = true,
    enable = true,
  },
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "alpha",
    "dashboard",
    "startify",
  },
  open_on_setup = false,
  open_on_tab = false,
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "icon",
    icons = {
      git_placement = "before",
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "S",
          unmerged = "",
          unstaged = "",
          untracked = "U",
        },
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
      },
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },
      symlink_arrow = ' >> ',
      webdev_colors = true,
    },
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    root_folder_modifier = ':t',
    special_files = {
      Makefile = true,
      MAKEFILE = true,
      ["README.md"] = true,
    }, -- List of filenames that gets highlighted with NvimTreeSpecialFile
  },
  respect_buf_cwd = true,
  system_open = {
    cmd = "",
    args = {},
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    adaptive_size = true,
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
}
