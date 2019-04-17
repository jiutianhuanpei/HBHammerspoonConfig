
local workWifi = "ZYHY-internet"

local outputDeviceName = 'Built-in Output'
hs.wifi.watcher.new(function()
    local currentWifi = hs.wifi.currentNetwork()
    local currentOutput = hs.audiodevice.current(false)

    if not currentWifi then return end
    
    if (currentWifi == workWifi and currentOutput.name == outputDeviceName) then
        hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)
    
    else
    	hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(false)
    end
end):start()



