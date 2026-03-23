function ListTabsAndWindows()
    -- Get a list of all tab page IDs
    local tabpages = vim.api.nvim_list_tabpages()
    print("Total tab pages: " .. #tabpages)

    -- Iterate over each tab page
    for i, tab_id in ipairs(tabpages) do
        -- Get the tab number (1-based index)
        local tab_number = vim.api.nvim_tabpage_get_number(tab_id)
        -- Get a list of window IDs in the current tab page
        local windows = vim.api.nvim_tabpage_list_wins(tab_id)
        print(string.format("  Tab %d (ID: %d) has %d windows:", tab_number, tab_id, #windows))

        -- Iterate over each window in the tab page
        for j, win_id in ipairs(windows) do
            -- Get the buffer number displayed in the window
            local bufnr = vim.api.nvim_win_get_buf(win_id)
            -- Get the buffer name (file path)
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            -- Get window number (optional, for display purposes)
            local win_number = vim.api.nvim_win_get_number(win_id)

            print(string.format("    Window %d (ID: %d): Buffer %d -> %s", win_number, win_id, bufnr, bufname))
        end
    end
end

-- To run this function, you can call it directly in a Lua file (e.g., init.lua) or via a command:
-- :lua ListTabsAndWindows()

-- => ListTabsAndWindows()
-- print: Total tab pages: 2
-- print:   Tab 1 (ID: 1) has 1 windows:
-- print:     Window 1 (ID: 1000): Buffer 11 -> replua://scratch
-- print:   Tab 2 (ID: 2) has 1 windows:
-- print:     Window 1 (ID: 1006): Buffer 7 -> health://
