-- https://neovim.io/doc/user/windows/
-- Scratch buffer for Lua evaluation
local window_list = vim.api.nvim_list_wins()
-- You can iterate over the list and perform actions on each window ID
for i, win_id in ipairs(window_list) do
    print("Window ID: " .. win_id)
end

-- print: Window ID: 1000

-- print: Window ID: 1000
-- print: Window ID: 1122

-- print: Window ID: 1000
-- print: Window ID: 1123

-- print: Window ID: 1000
-- print: Window ID: 1123
-- print: Window ID: 1125
