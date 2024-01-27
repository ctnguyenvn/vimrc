
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <silent> <leader>r :NvimTreeRefresh<CR>
nnoremap <silent> <leader>h :NvimTreeFocus<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue

lua << EOF
require "nvim-tree".setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    -- ignore_buffer_on_setup = false,
    -- open_on_setup = false,
    -- open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    reload_on_bufenter = true,
    respect_buf_cwd = false,
    view = {
        -- width = 30,
        -- height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {}
        }
    },
    renderer = {
        add_trailing = true,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  "
            }
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = ""
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                }
            }
        },
        -- special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"}
        special_files = {}
    },
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    },
    -- ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {}
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
        expand_all = {
            max_folder_discovery = 300
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        },
        remove_file = {
            close_window = true
        }
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false
        }
    }
}

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Default mappings key of nvim-tree plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <CR> or o on the root folder will cd in the above directory
" <C-]> will cd in the directory under the cursor
" <BS> will close current opened directory or parent
" type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
" type r to rename a file
" type <C-r> to rename a file and omit the filename on input
" type x to add/remove file/directory to cut clipboard
" type c to add/remove file/directory to copy clipboard
" type y will copy name to system clipboard
" type Y will copy relative path to system clipboard
" type gy will copy absolute path to system clipboard
" type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
" type d to delete a file (will prompt for confirmation)
" type D to trash a file (configured in setup())
" type ]c to go to next git item
" type [c to go to prev git item
" type - to navigate up to the parent directory of the current file/directory
" type s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
" if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
" if the file is a symlink, <CR> will follow the symlink (if the target is a file)
" <C-v> will open the file in a vertical split
" <C-x> will open the file in a horizontal split
" <C-t> will open the file in a new tab
" <Tab> will open the file as a preview (keeps the cursor in the tree)
" I will toggle visibility of hidden folders / files
" H will toggle visibility of dotfiles (files/folders starting with a .)
" R will refresh the tree
" Double left click acts like <CR>
" Double right click acts like <C-]>
" W will collapse the whole tree
" E will expand the whole tree. Be aware this might hang neovim for a while if running on a big folder (see :help nvim-tree.actions.expand_all.max_folder_discovery).
" S will prompt the user to enter a path and then expands the tree to match the path
" . will enter vim command mode with the file the cursor is on
" C-k will toggle a popup with file infos about the file under the cursor
" f will allow you to filter nodes dynamically based on regex matching.

