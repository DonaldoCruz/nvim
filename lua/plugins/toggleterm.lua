return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]], -- Toggle with Ctrl+\
        direction = 'horizontal',
        close_on_exit = false,
        shell = vim.o.shell,
      })
      -- Helper function to safely run Python
      local function run_python_file()
        local file = vim.fn.expand('%')
        if file == '' then
          print("No file to run")
          return
        end
        -- Force kill any existing job and run new one
        require('toggleterm').exec('python ' .. file, 1, nil, nil, nil, nil, true)
      end
      vim.keymap.set('n', '<C-CR>', run_python_file, { desc = 'Run Python file in terminal' })
      vim.keymap.set('n', '<D-CR>', run_python_file, { desc = 'Run Python file in terminal (Mac)' })
      
      -- Simpler visual selection - just send the text
      vim.keymap.set('v', '<C-CR>', function()
        require('toggleterm').send_lines_to_terminal("single_line", true, {args = 1})
      end, { desc = 'Run selection in terminal' })
    end  -- Add this missing 'end'
  }
}
