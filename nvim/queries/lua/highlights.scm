;; extends

((identifier) @namespace.builtin.vim
  (#eq? @namespace.builtin.vim "vim") (#set! "priority" 150))

((identifier) @variable.builtin.self
  (#eq? @variable.builtin.self "self") (#set! "priority" 150))

((identifier) @module.builtin
  (#any-of? @module.builtin "_G" "debug" "io" "jit" "math" "os" "package" "string" "table" "utf8")
  (#set! "priority" 150))
