-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- n: Normal mode.
-- i: Insert mode.
-- x: Visual mode.
-- s: Selection mode.
-- v: Visual + Selection.
-- t: Terminal mode.
-- o: Operator-pending.
-- '': Yes, an empty string. Is the equivalent of n + v + o.

-- {lhs} is the key we want to bind.
-- {rhs} is the action we want to execute. It can be a string with a command or an expression. You can also provide a lua function
-- {opts} this must be a lua table. If you don't know what is a "lua table" just think is a way of storing several values in one place. Anyway, it can have these properties.
-- desc: A string that describes what the keybinding does. You can write anything you want.
-- remap: A boolean that determines if our keybinding can be recursive. The default value is false. Recursive keybindings can cause some conflicts if used incorrectly. Don't enable it unless you know what you're doing. I will explain this recursive thing later.
-- buffer: It can be a boolean or a number. If we assign the boolean true it means the keybinding will only be effective in the current file. If we assign a number, it needs to be the "id" of an open buffer.
-- silent: A boolean. Determines whether or not the keybindings can show a message. The default value is false.
-- expr: A boolean. If enabled it gives the chance to use vimscript or lua to calculate the value of {rhs}. The default value is false.
vim.g.mapleader = ','
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<F2>', '<cmd>Lexplore<cr>')
vim.keymap.set('n', '<F3>', '<cmd>ReloadConfig<cr>')
