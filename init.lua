
-- vim.g - доступ к глобальным переменныем nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- lazy.nvim - менеджер плагинов
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- конкатенация строк vim.fn.stdpath("data" возвращает стандратный путь для хранения данных nvim (в linux это ~/.local/share/nvim) и прибавляется строка "/lazy/lazy.nvim" и получается путь

-- проверка существует ли lazy.nvim по этому, если условие истинно(тоесть файла нет или нет директории), то клонируется репозиторий 

if not vim.loop.fs_stat(lazypath) then 
    vim.fn.system({ -- vim.fn.system - выполняет системную команду
        "git",
        "clone",
        "--filter=blob:none", -- флаг, не загружать историю файлов(загружает последнюю версию)
        "https://github.com/folke/lazy.nvim.git",
        lazypath
   })
end
vim.opt.rtp:prepend(lazypath) -- vim.opt.rtp - это обращение к настройке runtimepath в neovim, это список путей, где nvim ищет плагины, скрипты, цвета, и др файлы конфигурации, prepend-метод который добавляет lazypath в начало этого списка

vim.g.mapleader = ' ' -- переменная, которая определяет префикс для пользовательских горячих клавиш

-- включаю модуль lazy
require("lazy").setup("configs.plugins")
-- включаю самописные модули(.lua файлы) из директории configs, настройки задем после загрузки плагинов

require("configs.options") 
require("configs.keymaps")
require("configs.autocmds")
