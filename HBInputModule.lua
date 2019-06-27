

-- local englistStr = "com.apple.keylayout.US"
-- local wubiStr = "im.rime.inputmethod.Squirrel.Rime"

-- local function HBCurrentSourceID()
-- 	return hs.keycodes.currentSourceID()
-- end 

-- local function Chinese() 

-- 	hs.keycodes.currentSourceID(wubiStr)
-- end

-- local function English( )
-- 	hs.keycodes.currentSourceID(englistStr)
-- end

-- local function _HBSetAppInputMethod( appName, setFun, event )
-- 	event = event or hs.window.filter.windowFocused
-- 	hs.window.filter.new(appName):subscribe(event, function ()
-- 		setFun()
-- 	end)
-- end 



-- local function HBSetEnglishApps( apps )
-- 	for i,v in ipairs(apps) do
-- 		_HBSetAppInputMethod(v, English)
-- 	end
-- end

-- local  function HBSetChineseApps( apps )
-- 	for i,v in ipairs(apps) do
-- 		_HBSetAppInputMethod(v, Chinese)
-- 	end
-- end

-- HBSetEnglishApps({"iTerm2", "Sublime Text", "Xcode", "网易有道词典", "Finder"})
-- HBSetChineseApps({"Safari 浏览器", "QQ音乐", "QQ", "微信"})


hs.hotkey.bind({'alt'}, "space", function (  )

	-- if (HBCurrentSourceID()) == wubiStr then 
		
	-- 	English()
	-- else  
	-- 	Chinese()
	-- end
end)


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





