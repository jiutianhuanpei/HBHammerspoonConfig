

local function HBSuperLayout( mods, key, alert, frame)

  hs.hotkey.bind(mods, key, function()

    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    -- lua 语法的下标不是从 0 开始，而是从 1 开始
    f.x = max.x + max.w * frame[1]
    f.y = max.y + max.h * frame[2]
    f.w = max.w * frame[3]
    f.h = max.h * frame[4]

    win:setFrame(f)

    if (string.len(alert) ~= 0)
    then
      hs.alert.closeAll();
      hs.alert(alert)
    end

  end)
end

-- shift ctrl alt cmd 可选
local mods = {"alt", "ctrl"}

-- 设置窗口位置
-- key：除 mods 之外的那个热键
-- alert：提示语，传 "" 时不提示
-- frame：窗口的位置，传入table，数值是主屏对应的 x y width height 的比例，0~1
local function HBLayout(key, alert, frame)
  HBSuperLayout(mods, key, alert, frame)  
end

HBLayout("left", "左", {0, 0, 0.5, 1})
HBLayout("right", "右", {0.5, 0, 0.5, 1})
HBLayout("up", "上", {0, 0, 1, 0.5})
HBLayout("down", "下", {0, 0.5, 1, 0.5})

HBLayout("pad4", "左上", {0, 0, 0.5, 0.5})
HBLayout("pad5", "右上", {0.5, 0, 0.5, 0.5})
HBLayout("pad1", "左下", {0, 0.5, 0.5, 0.5})
HBLayout("pad2", "右下", {0.5, 0.5, 0.5, 0.5})

HBLayout(",", "右大", {0, 0, 0.7, 1})
HBLayout(".", "左小", {0.7, 0, 0.3, 1})

HBLayout("space", "全屏", {0, 0, 1, 1})
HBLayout("tab", "居中", {0.2, 0.15, 0.6, 0.7})


