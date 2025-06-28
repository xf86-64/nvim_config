local config_dir = vim.fn.stdpath('config') -- ищу директорию config по стандартному пути nvim, записываю в config_dir
local opt = vim.opt

opt.termguicolors = true
opt.lazyredraw = true -- отключает перерисовку экрана во время выполнения макрсов скриптов и др операций 

opt.background = "dark"
opt.guifont = "JetBrainsMono Nerd Font:h12"
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor20"

opt.number = true -- нумерация строк

opt.cursorline = true
-- прокрутка
opt.scrolloff = 5     -- по вертикали
opt.sidescrolloff = 5 -- по горизонтали

opt.signcolumn = "yes" -- signcolumn вертикальная полоса слева от номеров строк(или текста), "yes"- всегда показывать (1 колонка)
opt.showcmd = false
opt.laststatus = 2 -- строка состояния только внизу экрана
opt.showmode = true

-- перенос строк
opt.wrap = true
opt.linebreak = true -- будет разрывать строки только в допустимых местах(после пробелов, символов-разделителей)
-- opt.list = true -- включает отображение невидимых символов

opt.expandtab = true -- замена символов табуляции на пробелы при отрисовке
opt.tabstop = 4 -- на сколько пробелов заменяется символ табуляции при отображении
opt.shiftwidth = 2 -- количество пробелов вставляемых при шифтинге
opt.softtabstop = 2 -- ширина отступа

opt.autoindent = true -- копирует отступ текущей строки на новую при нажатии enter
opt.smartindent = true -- автоматически добавляет/убирает отступы после({, do, then), (}, end, fi), ключевых слов(if, for, function) (работает даже без LSP) 

opt.breakindent = true -- при переносе строки добалять отступы

-- поиск
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.wrapscan = true
opt.inccommand = "split"

opt.clipboard = "unnamedplus" -- интеграция с системным буфером обмена
-- отключение бекапов и файлов подкачки (хранятся в ~/.local/state/nvim
opt.swapfile = true
opt.backup = false
opt.writebackup = false
opt.autoread = true -- обновлять буфер при изменении файла извне
-- делаем возможной отмену изменений уже после закрытия файла
opt.undofile = true
opt.undolevels = 1000
--opt.shada = "!, '1000, <50, s10, h" -- ограничения для shada-файлов

-- разделение окон
opt.splitbelow = true
opt.splitright = true
-- мышь и работа с текстом
opt.mouse = "a"
opt.mousemoveevent = true

opt.keymodel = "startsel,stopsel" -- выделение текста стрелками с зажатым shift
opt.keymap = "russian-jcukenwin" -- подключает русскую раскладку клавиатуры в режиме ввода текста, ппри этом сохраняет английские горячие клавиши в командных режимах(normal, visual)

-- делаем раскладку по умолчанию английскую
opt.iminsert = 0;
opt.imsearch = 0
-- привычное перемещение курсора
opt.whichwrap:append("hl<>[]") 

-- автокомлит
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- можно исключить из дополнения определенные типы файлов, имеющие бинарный формат
opt.wildignore:append { '*.o', '*.obj', '*.py[co]', '__pycache__/*', '*.so', '*.zip',
'*.rar', '*.tar.*', '*.gz', '*.docx', '*.xlsx', '*.pdf', '*.jpg', '*.jpeg', '*.gif',
'*.png' }

opt.completeopt = "menuone,noselect,noinsert" -- настройка поведения автодополнения, menuone-показывает меню дополнения, даже если только 1 вариант, noselect не выбирает 1 вариант автоматически, noinsert не вставляет текст автоматически только при нажатии enter
opt.pumheight = 10 -- высота всплывающего меню с вариантами для дополнения

-- таймауты
opt.timeoutlen = 500 -- сколько ms nvim ждет последующей клавиши в составе составной команды(gcc, ds)
opt.updatetime = 250 -- как часто: nvim записывает изменения в swap-файл, запускает события CursorHold, обновляет statusLine 

opt.spell = false -- отключает проверку орфографии
opt.spelllang = {"ru", "en"} -- указываю список языков для проверки орфографии

local spell_dir = config_dir .. '/speel'

if vim.fn.isdirectory(spell_dir) == 0 then --существует ли директория, если нет создаю с флагом p (включаю все родительские директории
    vim.fn.mkdir(spell_dir, 'p')
end




