local Notifier = {}

function Notifier.warning(message)
  vim.notify(message, vim.log.levels.WARN)
end

function Notifier.error(message)
  vim.notify(message, vim.log.levels.ERROR)
end

return Notifier
