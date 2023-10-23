return function()
  local count = {}

  local levels = {
    errors = 'Error',
    warnings = 'Warn',
    info = 'Info',
    hints = 'Hint',
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ''
  local warnings = ''
  local hints = ''
  local info = ''

  if count['errors'] ~= 0 then errors = string.format('  %s', count['errors']) end
  if count['warnings'] ~= 0 then warnings = string.format('  %s', count['warnings']) end
  if count['hints'] ~= 0 then hints = string.format('  %s', count['hints']) end
  if count['info'] ~= 0 then info = string.format('   %s', count['info']) end

  return string.format('%s%s%s%s', errors, warnings, hints, info)
end
