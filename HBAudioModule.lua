
--[[防止连上蓝牙之后音质变化--]]
function checkAudioDeviceStatus(param)

	if param ~= 'dIn ' then 
		return
	end


	local kuwoName = "KUWO_K1"
	local defaultName = "Built-in Microphone"

	local kuwo = hs.audiodevice.findDeviceByName(kuwoName)

	if kuwo == nil then 
		print("蓝牙未连接")
	else 
		print("蓝牙已连接")

		hs.audiodevice.findDeviceByName(defaultName):setDefaultInputDevice()

	end
end



hs.audiodevice.watcher.setCallback(checkAudioDeviceStatus)
hs.audiodevice.watcher.start()

-- 先设置一下
checkAudioDeviceStatus()



