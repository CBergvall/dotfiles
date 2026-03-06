local kb = libs.keyboard;
local m = libs.mouse;

-- Documentation
-- http://www.unifiedremote.com/api

-- Keyboard Library
-- http://www.unifiedremote.com/api/libs/keyboard

--@help Press f
actions.fullscreen = function ()
	kb.stroke("f");
end

--@help Press space bar
actions.pause = function ()
	kb.stroke("space");
end

--@help Press c
actions.captions = function ()
	kb.stroke("c");
end

--@help Press left button
actions.skip_backwards = function ()
	kb.stroke("left");
end

--@help Press right button
actions.skip_forwards = function ()
	kb.stroke("right");
end

--@help Scroll up
actions.scroll_down = function ()
	m.vscroll(-3);
end

--@help Scroll down
actions.scroll_up = function ()
	m.vscroll(3);
end

--@help Press ctrl + r
actions.refresh = function ()
	kb.stroke("ctrl", "r");
end

--@help Press 0 button
actions.restart = function ()
	kb.stroke("0");
end

--@help Open Youtube in Firefox
actions.open_youtube = function ()
	os.execute("start http://youtube.com");
end

--@help Open Spotify application
actions.open_spotify = function ()
	os.execute("start C:\\Users\\carlb\\AppData\\Roaming\\Spotify\\Spotify.exe");
end

--@help Open media folder in File Explorer
actions.open_media_folder = function ()
	os.execute("explorer.exe H:\\Plex");
end

--@help Change audio output to headphones
actions.headphones_output = function ()
	os.execute("nircmd setdefaultsounddevice \"Headphones\" 0");
end

--@help Change audio output to headphones
actions.headphones2_output = function ()
	os.execute("nircmd setdefaultsounddevice \"Headphones2\" 0");
end

--@help Change audio output to tv
actions.tv_output = function ()
	os.execute("nircmd setdefaultsounddevice \"LG TV\" 0");
end

--@help Lower system volume
actions.volume_down = function()
	kb.press("volumedown");
end

--@help Raise system volume
actions.volume_up = function()
	kb.press("volumeup");
end

--@help Minimize Window
actions.minimize = function ()
	kb.stroke("lwin", "down");
end

--@help Maximize Window
actions.maximize = function ()
	kb.stroke("lwin", "up");
end

--@help Focus Firefox application
actions.switch = function()
	if OS_WINDOWS then
		local hwnd = win.window("firefox.exe");
		if (hwnd == 0) then actions.launch(); end
		win.switchtowait("firefox.exe");
	end
end

--@help Zoom page in
actions.zoom_in = function()
	kb.stroke("control", "oem_plus");
end

--@help Zoom page out
actions.zoom_out = function()
	kb.stroke("control", "oem_minus");
end

--@help f11 (application fullscreen)
actions.funceleven = function()
	kb.stroke("f11");
end

--@help Force refocus on the currently active window
actions.refocus = function()
	if OS_WINDOWS then
		local hwnd = win.active();
		if hwnd ~= 0 then
			win.switchto(hwnd);
		end
	end
end

--@help Open or switch to YouTube in Firefox
actions.youtube_home = function ()
	kb.stroke("control", "L");
	kb.text("y")
	kb.stroke("enter");
end

--@help Type address
actions.address = function()
	actions.switch();
	keyboard.stroke("control", "L");
	device.keyboard();
end