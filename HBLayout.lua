

local lastKey = ""

local function HBSuperLayout( mods, key, alert, frame)

  hs.hotkey.bind(mods, key, function()

    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local nextPice = 10

    if (key == "up" and lastKey == key) then
      f.h = f.h - nextPice

    elseif (key == "left" and (lastKey == key or lastKey == ",")) then
      f.w = f.w - nextPice

    elseif (key == "down" and lastKey == key) then
      f.h = f.h - nextPice
      f.y = f.y + nextPice
      

    elseif (key == "right" and (lastKey == key or lastKey == ".")) then
      f.w = f.w - nextPice
      f.x = f.x + nextPice
      

    else
      -- lua 语法的下标不是从 0 开始，而是从 1 开始
      f.x = max.x + max.w * frame[1]
      f.y = max.y + max.h * frame[2]
      f.w = max.w * frame[3]
      f.h = max.h * frame[4]
    end 

    win:setFrame(f)

    lastKey = key

    if (string.len(alert) ~= 0) then
      hs.alert.closeAll();
      hs.alert(alert)
    end

  end)
end

-- shift ctrl alt cmd 可选
local outMods = {"alt", "ctrl"}
local inMods = {"alt", "ctrl", "cmd"}

local function HBLayout(key, alert, frame)
  HBSuperLayout(outMods, key, alert, frame)
end

local function HBInKeyboardLayout(key, alert, frame)
  HBSuperLayout(inMods, key, alert, frame)
end

HBLayout("left", "左", {0, 0, 0.5, 1})
HBLayout("right", "右", {0.5, 0, 0.5, 1})
HBLayout("up", "上", {0, 0, 1, 0.5})
HBLayout("down", "下", {0, 0.5, 1, 0.5})

-- 外接键盘
HBLayout("pad4", "左上", {0, 0, 0.5, 0.5})
HBLayout("pad5", "右上", {0.5, 0, 0.5, 0.5})
HBLayout("pad1", "左下", {0, 0.5, 0.5, 0.5})
HBLayout("pad2", "右下", {0.5, 0.5, 0.5, 0.5})

-- 内置键盘
HBInKeyboardLayout("up", "左上", {0, 0, 0.5, 0.5})
HBInKeyboardLayout("right", "右上", {0.5, 0, 0.5, 0.5})
HBInKeyboardLayout("left", "左下", {0, 0.5, 0.5, 0.5})
HBInKeyboardLayout("down", "右下", {0.5, 0.5, 0.5, 0.5})

HBLayout(",", "右大", {0, 0, 0.7, 1})
HBLayout(".", "左小", {0.7, 0, 0.3, 1})

HBLayout("space", "全屏", {0, 0, 1, 1})
HBLayout("tab", "居中", {0.2, 0.15, 0.6, 0.7})


