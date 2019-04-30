
local workWifi = "ZYHY-internet"

local outputDeviceName = 'Built-in Output'

hs.wifi.watcher.new(function()
    local currentWifi = hs.wifi.currentNetwork()
    local currentOutput = hs.audiodevice.current(false)

    if not currentWifi then return end

	print("watcher: 当前网络是：" , currentWifi)
    
    if (currentWifi == workWifi and currentOutput.name == outputDeviceName) then
        hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)
    
    else
    	hs.audiodevice.findDeviceByName(outputDeviceName):setOutputVolume(45)
    end
end):start()

-- 用于第一启动 mac 时，检测网络状态

local currentWifi = hs.wifi.currentNetwork()
local currentOutput = hs.audiodevice.current(false)

print("当前网络是：" , workWifi)

if (currentWifi == workWifi and currentOutput.name == outputDeviceName) then
    hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)
    
else
	hs.audiodevice.findDeviceByName(outputDeviceName):setOutputVolume(45)
end
