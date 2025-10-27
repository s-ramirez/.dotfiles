local log = hs.logger.new("launcher.lua", "debug")
log.d("loading module")

local appMappings = {
	{ key = "f", app = "Finder" },
	{ key = "b", app = "Firefox" },
	{ key = "c", app = "Slack" },
	{ key = "t", app = "Ghostty" },
}

local hyper = { "cmd", "alt", "ctrl", "shift" }

for _, mapping in ipairs(appMappings) do
	hs.hotkey.bind(hyper, mapping.key, function()
		log.d("Switching to", mapping.app)
		hs.application.launchOrFocus(mapping.app)
	end)
end
