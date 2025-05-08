local kb = libs.keyboard;
local m = libs.mouse;

-- Documentation
-- http://www.unifiedremote.com/api

-- Keyboard Library
-- http://www.unifiedremote.com/api/libs/keyboard

--@help fullscreen
actions.fullscreen = function ()
	kb.stroke("f");
end

--@help pause
actions.pause = function ()
	kb.stroke("space");
end

--@help captions
actions.captions = function ()
	kb.stroke("c");
end

--@help skip_backwards
actions.skip_backwards = function ()
	kb.stroke("left");
end

--@help skip_forwards
actions.skip_forwards = function ()
	kb.stroke("right");
end

actions.scroll_down = function ()
	m.vscroll(-4);
end

actions.scroll_up = function ()
	m.vscroll(4);
end

--@help open_youtube
actions.open_youtube = function ()
	os.execute("start http://youtube.com");
end

--@help Lower system volume
actions.volume_down = function()
	kb.press("volumedown");
end

--@help Raise system volume
actions.volume_up = function()
	kb.press("volumeup");
end