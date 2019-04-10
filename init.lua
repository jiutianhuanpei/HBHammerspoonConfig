-- 重载配置
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert("配置已重载")

require "HBLayout"
