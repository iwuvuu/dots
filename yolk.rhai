export let eggs = #{
	kitty: #{
		targets: "~/.config/kitty",
		templates: ["kitty.conf"],
		enabled: true,
	},
	nvim: #{
		targets: "~/.config/nvim",
		templates: ["init.lua"],
		enabled: true,
	},
	bin: #{
		targets: "~/.local/bin",
		templates: ["*.sh"],
		enabled: true,
	},
	rofi: #{
		targets: "~/.config/rofi",
		templates: ["*.rasi"],
		enabled: true,
	},
};

const themes = #{
	gruvbox: #{
		background: "#282828",
    foreground: "#ebdbb2",
		blackdark: "#3c3836",
		blacklight: "#504945",
		reddark: "#cc241d",
		redlight: "#fb4934",
		greendark: "#98971a",
		greenlight: "#b8bb26",
		yellowdark: "#d79921",
		yellowlight: "#fabd2f",
		bluedark: "#458588",
		bluelight: "#83a598",
		magentadark: "#b16286",
		magentalight: "#d3869b",
		cyandark: "#689d6a",
		cyanlight: "#8ec07c",
		whitedark: "#928374",
		whitelight: "#a89984",
  },
	mytheme: #{
		foreground: "#def7f8",
		background: "#160c23",
		blackdark: "#262434",
		blacklight: "#3f374a",
		reddark: "#b93669",
		redlight: "#ea537a",
		greendark: "#66be88",
		greenlight: "#8cf49c",
		yellowdark: "#acb17d",
		yellowlight: "#fcf0a8",
		bluedark: "#5a95ba",
		bluelight: "#aeeaff",
		magentadark: "#9e6dbb",
		magentalight: "#eca9ff",
		cyandark: "#63b7ae",
		cyanlight: "#a1ffe6",
		whitedark: "#a2abab",
		whitelight: "#dbe8e8",
	},
};

export const data = #{
	colors: themes.gruvbox
};
