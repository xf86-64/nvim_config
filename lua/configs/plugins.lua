local setup_lsp_keymaps = require("configs.keymaps").setup_lsp_keymaps

return
{
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        filters = { dotfiles = true },
        git = { enable = true },
        actions = {
          open_file =
          {
            quit_on_open = true,
          },
        },

        hijack_netrw = true

      })
    end,

  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup({

      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies =
    {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'mrcjkb/rustaceanvim',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        })
      })

      local lspconfig = require('lspconfig') -- lsp

      local capabilities = require("cmp_nvim_lsp").default_capabilities()



      -- eclipse.jdtls java lsp
      vim.lsp.enable('jdtls')
      vim.lsp.config('jdtls', {
        cmd = { '/usr/bin/jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
      })
      -- lua_ls lsp lua
      vim.lsp.enable('lua_ls')
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT"
            }
          }
        }
      })
      -- rust (rust-analyzer lsp)
      vim.lsp.enable('rust-analyzer')
      vim.lsp.config('rust_analyzer', {
        settings = {
          ['rust-analyzer'] = {},
        },
      })

      -- python lsp (pyright)
      vim.lsp.enable('pyright')
      vim.lsp.config('pyright', {
        cmd = { "pyright-langserver", "--stdio" },
      })
      -- C/C++ (clang)
      vim.lsp.enable('clangd')
      vim.lsp.config('clangd', {
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true,
                insertReplaceSupport = true
              }
            }
          }
        }
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end

  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('lualine').setup({
        sections =
        {
          lualine_x =
          {
            {
              function()
                if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
                  return '⌨' .. vim.b.keymap_name
                end
                return ''
              end,
              cond = function()
                return vim.opt.iminsert:get() > 0 and vim.b.keymap_name ~= nil
              end,
            },
            'encoding',
            'fileformat',
            'filetype'
          }
        }
      })
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup
      {
        options =
        {
          mode = "buffers",
          separator_style = "slant"
        }
      }
    end,

  },
  {
    "bakageddy/alduin.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("alduin").setup({
        terminal_colors = true,
        inverse = true,
        palette_overrides = {},
        overrides = {}
      })
      vim.cmd [[colorscheme alduin]]
    end
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require('transparent').setup({
        extra_groups =
        {
          'NormalFloat',
        },
        exclude_groups = { 'CursorLine' },
      })
    end
  }
}
