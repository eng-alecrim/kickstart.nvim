function SaveCode()
  local current_file = vim.fn.expand '%'
  local ext = vim.fn.fnamemodify(current_file, ':e')
  if ext == 'py' then
    vim.cmd('w | !python -m black ' .. current_file)
  else
    vim.cmd 'w'
  end
end

vim.cmd 'command! -nargs=0 SaveCode lua SaveCode()'

function RunCode()
  local current_file = vim.fn.expand '%'
  local ext = vim.fn.fnamemodify(current_file, ':e')
  if ext == 'py' then
    vim.cmd('!python ' .. current_file)
  elseif ext == 'go' then
    vim.cmd('!go run ' .. current_file)
  elseif ext == 'js' then
    vim.cmd('!node ' .. current_file)
  elseif ext == 'rs' then
    vim.cmd('!cargo run ' .. current_file)
  end
end

vim.cmd 'command! -nargs=0 RunCode lua RunCode()'

function CompileCode()
  local current_file = vim.fn.expand '%'
  local ext = vim.fn.fnamemodify(current_file, ':e')
  if ext == 'c' then
    local output_file = vim.fn.expand '%:r'
    vim.cmd 'w' -- Save the current buffer
    vim.cmd('!' .. 'gcc -o ' .. output_file .. ' ' .. current_file) -- Compile with gcc
  else
    vim.cmd 'w'
  end
end

vim.cmd 'command! -nargs=0 CompileCode lua CompileCode()'

-- Para salvar usando o Black
vim.keymap.set('n', '<leader>cw', ':SaveCode<CR>', { desc = '[C]ode [S]ave' })

-- Para rodar o código
vim.keymap.set('n', '<leader>cr', ':RunCode<CR>', { desc = '[C]ode [R]un' })

-- Para compilar
vim.keymap.set('n', '<leader>cc', ':CompileCode<CR>', { desc = '[C]ode [C]ompile' })

--
-- Para salvar usando o Black
vim.keymap.set('n', '<leader>cw', ':SaveCode<CR>', { desc = '[C]ode [S]ave' })

-- Para salvar usando o Black e rodar
vim.keymap.set('n', '<leader>cr', ':RunCode<CR>', { desc = '[C]ode [R]un' })

>>>>>>> bee2901 (atts)
-- Para o obsidian-neovim
vim.opt.conceallevel = 1
