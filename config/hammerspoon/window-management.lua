-- Replacement for Rectangle
local log = hs.logger.new("win-manage", "debug")

-- Disable window animations
hs.window.animationDuration = 0

-- Functions to check current state

local is_left_half = function(window, screen)
	return window.x == screen.x and window.y == screen.y and window.w == screen.w // 2 and window.h == screen.h
end

local is_left_two_thirds = function(window, screen)
	return window.x == screen.x and window.y == screen.y and window.w == ((screen.w // 3) * 2) and window.h == screen.h
end

local is_right_half = function(window, screen)
	return window.x == (screen.w // 2) + screen.x
		and window.y == screen.y
		and window.w == screen.w // 2
		and window.h == screen.h
end

local is_right_two_thirds = function(window, screen)
	return window.x == ((screen.w // 3) + screen.x)
		and window.y == screen.y
		and window.w == ((screen.w // 3) * 2)
		and window.h == screen.h
end

-- Resize a window vs a screen.

local resize_full_screen = function(window, screen)
	window.x = screen.x
	window.y = screen.y
	window.w = screen.w
	window.h = screen.h
	return window
end

local resize_left_half = function(window, screen)
	window.x = screen.x
	window.y = screen.y
	window.w = screen.w // 2
	window.h = screen.h
	return window
end

local resize_left_third = function(window, screen)
	window.x = screen.x
	window.y = screen.y
	window.w = screen.w // 3
	window.h = screen.h
	return window
end

local resize_left_two_thirds = function(window, screen)
	window.x = screen.x
	window.y = screen.y
	window.w = (screen.w // 3) * 2
	window.h = screen.h
	return window
end

local resize_right_half = function(window, screen)
	window.x = (screen.w // 2) + screen.x
	window.y = screen.y
	window.w = screen.w // 2
	window.h = screen.h
	return window
end

local resize_right_third = function(window, screen)
	window.x = (screen.w // 3) * 2 + screen.x
	window.y = screen.y
	window.w = screen.w // 3
	window.h = screen.h
	return window
end

local resize_right_two_thirds = function(window, screen)
	window.x = (screen.w // 3) + screen.x
	window.y = screen.y
	window.w = (screen.w // 3) * 2
	window.h = screen.h
	return window
end

-- Run the correct resize function for a user request.

local left_half = function(windowFrame, screenFrame)
	if is_left_half(windowFrame, screenFrame) then
		return resize_left_two_thirds(windowFrame, screenFrame)
	elseif is_left_two_thirds(windowFrame, screenFrame) then
		return resize_left_third(windowFrame, screenFrame)
	else
		return resize_left_half(windowFrame, screenFrame)
	end
end

local next_display = function(windowFrame, screenFrame)
	return resize_full_screen(
		windowFrame,
		(hs.window.focusedWindow() or hs.window.frontmostWindow()):screen():next():frame()
	)
end

local full_screen = function(windowFrame, screenFrame)
	return resize_full_screen(windowFrame, screenFrame)
end

local right_half = function(windowFrame, screenFrame)
	if is_right_half(windowFrame, screenFrame) then
		return resize_right_two_thirds(windowFrame, screenFrame)
	elseif is_right_two_thirds(windowFrame, screenFrame) then
		return resize_right_third(windowFrame, screenFrame)
	else
		return resize_right_half(windowFrame, screenFrame)
	end
end

local key_bindings = {
	{ key = "h", func = left_half, func_name = "left_half" },
	{ key = "m", func = full_screen, func_name = "full_screen" },
	{ key = "l", func = right_half, func_name = "right_half" },
}

for _, hotkey in ipairs(key_bindings) do
	hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, hotkey.key, function()
		log.df("User ran Hyper-%s, moving window to %s", hotkey.key, hotkey.func_name)
		local window = hs.window.focusedWindow() or hs.window.frontmostWindow()
		local newFrame = hotkey.func(window:frame(), window:screen():frame())
		window:setFrame(newFrame)
	end)
end
