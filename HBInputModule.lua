
local function Chinese() 

	hs.keycodes.currentSourceID("com.sogou.inputmethod.sogouWB.wubi")
end

local function English( )
	hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

local function _HBSetAppInputMethod( appName, setFun, event )
	event = event or hs.window.filter.windowFocused
	hs.window.filter.new(appName):subscribe(event, function ()
		setFun()
	end)
end 

local function HBSetEnglishApps( apps )
	for i,v in ipairs(apps) do
		_HBSetAppInputMethod(v, English)
	end
end

local  function HBSetChineseApps( apps )
	for i,v in ipairs(apps) do
		_HBSetAppInputMethod(v, Chinese)
	end
end

HBSetEnglishApps({"iTerm2", "Sublime Text", "Xcode", "网易有道词典", "访达", "Finder"})
HBSetChineseApps({"Safari 浏览器", "QQ音乐", "QQ", "微信"})


-- 用于Debug app属性

hs.hotkey.bind({'ctrl', i}, ".", function()
local aa = "\n\nApp path: "
..hs.window.focusedWindow():application():path()
.."\n"
.."App name: "
..hs.window.focusedWindow():application():name()
.."\n"
.."IM source id: "
..hs.keycodes.currentSourceID()

print(aa)
end)





