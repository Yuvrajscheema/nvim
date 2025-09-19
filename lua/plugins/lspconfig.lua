return {
  "neovim/nvim-lspconfig",

  config = function()
    local lspconfig = require("lspconfig")
    -- Clangd Setup
    lspconfig.clangd.setup {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--compile-commands-dir=."
      },
      keys = {
        { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
          fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
      end,
      capabilities = {
        offsetEncoding = { "utf-16" }
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    }

    lspconfig.rust_analyzer.setup {
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false,
          }
        }
      }
    }

    vim.lsp.enable('asm_lsp', {
    })



    lspconfig.ts_ls.setup {
      settings = {
        typescript = {
          format = {
            indentSize = 2,
            convertTabsToSpaces = true,
          },
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
          },
          suggest = {
            autoImports = true,
          },
          tsserver = {
            logVerbosity = "off",
            maxTsServerMemory = 4096,
          },
        },
        javascript = {
          format = {
            indentSize = 2,
            convertTabsToSpaces = true,
          },
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
          },
        },
      },
    }



    -- Lua LS Setup
    lspconfig.lua_ls.setup {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and
              (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          }
        })
      end,
      settings = {
        Lua = {}
      },
    }

    -- Pyright Setup for Python
    lspconfig.pyright.setup {
      settings = {
        python = {
          pythonPath = vim.fn.exepath("python3"),
        },
      },
    }
  end
}
