-- 重载配置
hs.alert("配置已重载")
function reloadConfig(files)
  local doReload = false

  for _,file in pairs(files) do

    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then

    hs.reload()    
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()


require "HBLayout"
require "HBSpoonsPlugins"
-- require "HBForWork"
require "HBInputModule"
require "HBAudioModule"
require "HBHeadphone"
require "HBTools"





