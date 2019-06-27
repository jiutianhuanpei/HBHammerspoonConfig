

function bluetoothSwitch( status )
	-- status: 0: off, 1: on
	cmd = "/usr/local/bin/blueutil --power "..(status)
	hs.osascript.applescript(string.format('do shell script "%s"', cmd))

end


function caffeinateCallback( eventType )

	if eventType == hs.caffeinate.watcher.screensDidLock or eventType == hs.caffeinate.watcher.screensDidSleep then
		bluetoothSwitch(0)
	elseif eventType == hs.caffeinate.watcher.screensDidUnlock or eventType == hs.caffeinate.watcher.screensDidWake then
		bluetoothSwitch(1)
	end
end

caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()
