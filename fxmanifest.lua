fx_version "adamant"
game "gta5"

ui_page "client/html/index.html"

client_scripts {
  "config.lua",
  "client/main.lua"
}

server_scripts {
  "server/main.lua"
}

files {
  "client/html/index.html",
  "client/html/dist/styles.css",
  "client/html/script.js",
  "client/html/img/*.png"
}
