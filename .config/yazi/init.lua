require("folder-rules"):setup()

require("smart-enter"):setup({
	open_multi = true,
})

require("full-border"):setup()

require("starship"):setup()

require("git"):setup()

require("bookmarks"):setup({
	last_directory = { enable = true },
})

require("projects"):setup({
	save = {
		method = "yazi",
	},
})
