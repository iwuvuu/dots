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
	eww: #{
		targets: "~/.config/eww",
		templates: ["**/*.scss"],
		enabled: true,
	},
};

const themes = #{
	gruvbox: #{
		bg0: "#1d2021",
		background: "#1d2021",
		backgroundAlpha: 0.8,
		bg3: "#665c54",
    foreground: "#ebdbb2",
		accentDark: "#d65d0e",
		accentLight: "#fe8019",
		blackDark: "#3c3836",
		blackLight: "#504945",
		redDark: "#cc241d",
		redLight: "#fb4934",
		greenDark: "#98971a",
		greenLight: "#b8bb26",
		yellowDark: "#d79921",
		yellowLight: "#fabd2f",
		blueDark: "#458588",
		blueLight: "#83a598",
		magentaDark: "#b16286",
		magentaLight: "#d3869b",
		cyanDark: "#689d6a",
		cyanLight: "#8ec07c",
		whiteDark: "#928374",
		whiteLight: "#a89984",
		backgroundTrans90: "#1d2021E6",
		backgroundTrans80: "#1d2021B3",
		accentDarkTrans: "#d65d0e1A",
		blackDarkTrans40: "#3c383666",

  },
	mytheme: #{
		foreground: "#def7f8",
		background: "#160c23",
		blackDark: "#262434",
		blackLight: "#3f374a",
		redDark: "#b93669",
		redLight: "#ea537a",
		greenDark: "#66be88",
		greenLight: "#8cf49c",
		yellowDark: "#acb17d",
		yellowLight: "#fcf0a8",
		blueDark: "#5a95ba",
		blueLight: "#aeeaff",
		magentaDark: "#9e6dbb",
		magentaLight: "#eca9ff",
		cyanDark: "#63b7ae",
		cyanLight: "#a1ffe6",
		whiteDark: "#a2abab",
		whiteLight: "#dbe8e8",
	},
};

const fonts = #{
	fira: #{
		normal: "FiraCode Nerd Font propo 12",
	}
};

const opts = #{
	gaps: #{
		out: 10,
	},
	border: 3,
	text: "bac",
};

const transparency = #{
	background: 0.8,
};

export const data = #{
	colors: themes.gruvbox,
	font: fonts.fira,
	gaps: opts.gaps,
	border: opts,
	alpha: transparency,
};
