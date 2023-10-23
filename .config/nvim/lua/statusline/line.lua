return function()
  if vim.bo.filetype == 'alpha' then return '' end
  return ' %P %l:%c '
end
