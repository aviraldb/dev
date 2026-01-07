return {
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
            check_outdated_package_on_open = true,
            border = "single",
            backdrop = 80,
            width = 0.75,
            height = 0.60,
        },
    })
}
