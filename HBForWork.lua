
local workWifi = "ZYHY-internet"
local homeWifi1 = "HUAWEI-RT8AT9"
local homeWifi2 = "mywifi_5G"
local homeWifi3 = "mywifi_2G"

local outputDeviceName = 'Built-in Output'

local voiceNum = 20

function ssidChangedCallback() -- 回调
    ssid = hs.wifi.currentNetwork() -- 获取当前 WiFi ssid
    if (ssid ~= nil) then
        print("watcher: 当前网络是：" , ssid)
        print("aa:", ssid == homeWifi2)

        if (ssid == homeWifi1 or ssid == homeWifi2 or ssid == homeWifi3) then
            hs.notify.new({title="当前位置", informativeText="回家喽"}):send()
            hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(false)
            hs.audiodevice.findDeviceByName(outputDeviceName):setOutputVolume(voiceNum)
        else
            
            hs.notify.new({title="当前位置", informativeText="在公司了"}):send() -- 发出通知
            hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)
        end
    else
        print("watcher: 当前wifi未连接")
        hs.notify.new({title="当前wifi未连接", informativeText=""}):send()
    end
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start() -- 开始监控


-- 用于第一启动 mac 时，检测网络状态

local currentWifi = hs.wifi.currentNetwork()
local currentOutput = hs.audiodevice.current(false)

print("当前网络是：" , currentWifi)

if (currentWifi == homeWifi1 or currentWifi == homeWifi2 or ssid == homeWifi3) then

    hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(false)
    hs.audiodevice.findDeviceByName(outputDeviceName):setOutputVolume(voiceNum)
    print("在家")
    
else
    hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)    
    print("冇在家")
end
