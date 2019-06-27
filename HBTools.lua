


local function editMyWubiDic()
	
	-- 编辑个人词库
	cmd = "open /Users/hongbang/Library/Rime/wubi86_jidian_user.dict.yaml"
	os.execute(cmd)

end

-- 热键打开个人词库
hs.hotkey.bind({"ctrl", "cmd"}, "m", editMyWubiDic)


local function reloadWubiDic( aaa )

	cmd = '/Library/Input\\ Methods/Squirrel.app/Contents/MacOS/Squirrel --reload'
	os.execute(cmd)	
end 

hs.pathwatcher.new("/Users/hongbang/Library/Rime/wubi86_jidian_user.dict.yaml", reloadWubiDic):start()	
