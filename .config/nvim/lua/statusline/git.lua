return function()
  local branch_name = vim.fn.system('git branch --show-current 2>/dev/null | tr -d "\n"')

  if branch_name ~= '' then
    return string.format(' [ %s] ', branch_name)
  else
    return ''
  end
end
