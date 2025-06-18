export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
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
	}
};
