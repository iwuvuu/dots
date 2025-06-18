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
};

const themes = #{
    gruvbox: #{
        background: "#282828",
        foreground: "#ebdbb2",
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
    colors: themes.mytheme
};
