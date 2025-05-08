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
	kb.stroke("command", "r");
end

--@help Press 0 button
actions.restart = function ()
	kb.stroke("0");
end

--@help Open Youtube in Firefox
actions.open_youtube = function ()
	os.execute("youtube");
end

--@help Open Spotify application
actions.open_spotify = function ()
	os.execute("open /Applications/Spotify.app");
end

--@help Open media folder in File Explorer
actions.open_media_folder = function ()
	os.execute("open /Users/carlbergvall/Movies");
end

--@help Lower system volume
actions.volume_down = function()
	kb.press("volumedown");
end

--@help Raise system volume
actions.volume_up = function()
	kb.press("volumeup");
end