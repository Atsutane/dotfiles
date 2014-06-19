" Vim syntax file
" Language: i3-wm config file
" Maintainer: David Pugnasse
" Latest Revision: 24 August 2011

if exists("b:current_syntax")
  finish
endif

" Symbols
syn match   i3Operators "+\|→"
syn match   i3ChainDelimiter ";"

syn match   i3Var "\$\w\+"

" Strings
syn region  i3SimpleString keepend start='[^ \t]' end='$\|;' contained contains=i3ChainDelimiter,i3Var
syn match   i3QuotedString '"[^"]\+"' contained
syn cluster i3String contains=i3SimpleString,i3QuotedString

" Config keywords
syn keyword i3ConfigCommand bind bindcode bindsym assign new_window popup_during_fullscreen font floating_modifier default_orientation workspace_layout for_window focus_folows_mouse
syn match   i3IpcSocket "ipc-socket" nextgroup=@i3String skipwhite

" Key modifiers
syn keyword i3KeyModifier Shift Control Mod1 Mod2 Mod3 Mod4 Mod5

" Command keywords
syn keyword i3Command exit reload restart kill window fullscreen global layout border focus move open split append_layout mark resize grow shrink restore
syn keyword i3Param 1pixel default stacked tabbed normal none tiling stacking floating enable disable up down horizontal vertical up down left right parent child px or ppt leave_fullscreen toggle mode_toggle
syn keyword i3WsSpecialParam next prev

" Commands
syn region  i3ExecCommand keepend start='[^ \t]' end='$\|;' contained contains=i3ChainDelimiter,i3Var
syn match   i3QuotedExecCommand '"[^"]\+"' contained
syn keyword i3ExecKeyword exec exec_always nextgroup=i3QuotedExecCommand,i3ExecCommand skipwhite

" Font statement
syn keyword i3FontStatement font nextgroup=@i3String skipwhite

" Set statement
syn match   i3SetVar "\$\w\+" contained nextgroup=@i3String skipwhite
syn keyword i3SetKeyword set nextgroup=i3SetVar skipwhite

" Workspaces
syn keyword i3WsKeyword workspace nextgroup=i3WsSpecialParam,@i3String skipwhite

" Mode
syn keyword i3ModeKeyword mode nextgroup=@i3String skipwhite

" Comments
syn keyword i3Todo contained TODO FIXME XXX NOTE
syn match   i3Comment "#.*$" contains=i3Todo

" Hex color code
syn match i3Color "#[0-9a-fA-F]\{6\}" contained nextgroup=i3Color skipwhite
syn match i3ColorDef "client\.\(focused_inactive\|focused\|unfocused\|urgent\|background\)" nextgroup=i3Color skipwhite

highlight link i3ChainDelimiter    Operator
highlight link i3Operators         Operator

highlight link i3ExecCommand       Special
highlight link i3QuotedExecCommand Special

highlight link i3Param             Constant
highlight link i3Color             Constant
highlight link i3WsSpecialParam    Constant

highlight link i3Var               Identifier
highlight link i3SetVar            Identifier

highlight link i3KeyModifier       Function

highlight link i3SimpleString      String
highlight link i3QuotedString      String
highlight link i3WsName            String
highlight link i3QuotedWsName      String
highlight link i3SetValue          String
highlight link i3Font              String

highlight link i3ExecKeyword       Keyword
highlight link i3Command           Keyword
highlight link i3WsKeyword         Keyword

highlight link i3ColorDef          Define
highlight link i3ConfigCommand     Define
highlight link i3IpcSocket         Define
highlight link i3SetKeyword        Define
highlight link i3ModeKeyword       Define
highlight link i3FontStatement     Define

highlight link i3Todo              Todo
highlight link i3Comment           Comment