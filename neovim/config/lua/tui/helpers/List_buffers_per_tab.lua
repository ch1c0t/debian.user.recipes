function List_buffers_per_tab()
    print("--- Buffers per Tab Page ---")
    -- Iterate over all tab pages
    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
        local tab_num = vim.api.nvim_tabpage_get_number(tab)
        print("\nTab Page " .. tab_num .. ":")
        local buffers_in_tab = {}
        
        -- Get all windows in the current tab page
        local windows = vim.api.nvim_tabpage_list_wins(tab)
        for _, win in ipairs(windows) do
            -- Get the buffer number for each window
            local bufnr = vim.api.nvim_win_get_buf(win)
            -- Get the buffer name/path
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            -- Add to the list if not already present in this tab
            if not buffers_in_tab[bufnr] then
                buffers_in_tab[bufnr] = bufname
                print("  Buffer " .. bufnr .. ": " .. bufname)
            end
        end
    end
    print("--------------------------")
end

-- print: --- Buffers per Tab Page ---
-- print: 
-- print: Tab Page 1:
-- print:   Buffer 15: replua://scratch
-- print: 
-- print: Tab Page 2:
-- print:   Buffer 5: health://
-- print: --------------------------
