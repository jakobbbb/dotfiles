" ============================================================================
" Name:     Jakob's vim color scheme
" Author:   Jakob Ruckel github.com/jakobbbb
" Original Author:   Jonathan Filip <jfilip1024@gmail.com>
" Version:  8.1.7
" ----------------------------------------------------------------------------
"
" This theme is basically Jonathan Filip's `lucius` theme, with slightly
" different colors.
" https://github.com/jonathanfilip/lucius
"
" License:
"
" Copyright (c) 2020 Jakob Ruckel
" Copyright (c) 2015 Jonathan Filip
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" ============================================================================


" ============================================================================
" Options:
" ============================================================================

unlet! g:colors_name
hi clear
if exists("syntax_on")
    syntax reset
endif


" ============================================================================
" Color Map:
" ============================================================================

let s:color_map = {
    \ 'bg': 'bg',
    \ 'fg': 'fg',
    \ 'NONE': 'NONE',
    \ '#005f87':  '24',
    \ '#303030': '236',
    \ '#3a3a3a': '237',
    \ '#444444': '0',
    \ '#4e4e4e': '235',
    \ '#5f5f00':  '58',
    \ '#5f5f87':  '60',
    \ '#5f875f':  '65',
    \ '#5faf5f':  '71',
    \ '#5fafd7':  '74',
    \ '#5fd7d7':  '80',
    \ '#626262': '241',
    \ '#808080': '244',
    \ '#870000':  '88',
    \ '#875f5f':  '95',
    \ '#87875f': '101',
    \ '#87af00': '23',
    \ '#87afd7': '110',
    \ '#87d7af': '115',
    \ '#87d7d7': '116',
    \ '#87d7ff': '117',
    \ '#9e9e9e': '247',
    \ '#afd787': '150',
    \ '#afd7af': '151',
    \ '#afd7d7': '152',
    \ '#b2b2b2': '249',
    \ '#bcbcbc': '250',
    \ '#d0d0d0': '252',
    \ '#d78700': '172',
    \ '#d7875f': '173',
    \ '#d7af5f': '179',
    \ '#d7afd7': '182',
    \ '#d7d75f': '185',
    \ '#d7d7af': '187',
    \ '#d7d7d7': '188',
    \ '#ff5f5f': '203',
    \ '#ff8787': '210',
    \ '#ffff87': '228',
    \ }


" ============================================================================
" Functions:
" ============================================================================

function! s:AddCterm(name)
    exec "let l:gfg = synIDattr(synIDtrans(hlID('" . a:name .
                \ "')), 'fg', 'gui')"
    exec "let l:gbg = synIDattr(synIDtrans(hlID('" . a:name .
                \ "')), 'bg', 'gui')"
    let l:gfg = l:gfg == "" ? "NONE" : l:gfg
    let l:gbg = l:gbg == "" ? "NONE" : l:gbg
    exec "hi " . a:name . " ctermfg=" . s:color_map[l:gfg] .
                \ " ctermbg=" . s:color_map[l:gbg]
endfunction

function! s:AddSpCterm(name)
    exec "let l:gsp = synIDattr(synIDtrans(hlID('" . a:name .
                \ "')), 'sp', 'gui')"
    let l:gsp = l:gsp == "" ? "NONE" : l:gsp
    exec "hi " . a:name . " ctermfg=" . s:color_map[l:gsp]
endfunction


" ============================================================================
" Text Groups:
" ============================================================================

let s:normal_items = [
            \ "ColorColumn", "Comment", "Conceal", "Constant", "Cursor", "CursorColumn",
            \ "CursorIM", "CursorLine", "CursorLineNr", "DiffAdd", "DiffChange",
            \ "DiffDelete", "Directory", "Error", "ErrorMsg", "Identifier",
            \ "IncSearch", "LineNr", "MatchParen", "ModeMsg", "MoreMsg",
            \ "NonText", "Pmenu", "PmenuSbar", "PmenuSel",
            \ "PmenuThumb", "PreProc", "Question", "Search", "SignColumn",
            \ "Special", "SpecialKey", "Statement", "StatusLineNC", "TabLine",
            \ "TabLineFill", "Todo", "Type", "VertSplit", "Visual",
            \ "WarningMsg", "WildMenu",
            \ ]

let s:bold_items = [
            \ "DiffText", "FoldColumn", "Folded", "StatusLine", "TabLineSel",
            \ "Title", "CursorLineNr",
            \ ]

let s:underline_items = [
            \ "Underlined", "VisualNOS"
            \ ]

let s:undercurl_items = [
            \ "SpellBad", "SpellCap", "SpellLocal", "SpellRare"
            \ ]


" ============================================================================
" Color Definitions:
" ============================================================================

" ----------------------------------------------------------------------------
" 'Normal' Colors:
" ----------------------------------------------------------------------------

hi clear Normal
hi Normal gui=none cterm=none term=none

        hi Normal       guifg=#d7d7d7

        hi Normal                       guibg=#303030

call s:AddCterm("Normal")


" ----------------------------------------------------------------------------
" Extra setup
" ----------------------------------------------------------------------------

" Clear default settings
for s:item in s:normal_items + s:bold_items + s:underline_items + s:undercurl_items
    exec "hi " . s:item . " guifg=NONE guibg=NONE gui=none"
                \ . " ctermfg=NONE ctermbg=NONE cterm=none term=none"
endfor

let g:colors_name="jakob"


" ----------------------------------------------------------------------------
" Text Markup:
" ----------------------------------------------------------------------------

    hi NonText      guifg=#5f5f87
    hi SpecialKey   guifg=#5f875f
        hi Comment      guifg=#808080
        hi Conceal      guifg=#808080
        hi Constant     guifg=#d7d7af
        hi Directory    guifg=#afd7af
        hi Identifier   guifg=#afd787
        hi PreProc      guifg=#87d7af
        hi Special      guifg=#d7afd7
        hi Statement    guifg=#87d7ff
        hi Title        guifg=#5fafd7
        hi Type         guifg=#87d7d7


" ----------------------------------------------------------------------------
" Highlighting:
" ----------------------------------------------------------------------------

hi Cursor       guifg=bg
hi CursorColumn guifg=NONE
hi CursorIM     guifg=bg
hi CursorLine   guifg=NONE
hi Visual       guifg=NONE
hi VisualNOS    guifg=fg        guibg=NONE
    hi CursorColumn                 guibg=#444444
    hi CursorLine                   guibg=#444444
    hi IncSearch    guifg=bg
    hi MatchParen   guifg=fg        guibg=#87af00
    hi Search       guifg=bg
    hi Visual                       guibg=#005f87
        hi Cursor                       guibg=#87afd7
        hi CursorIM                     guibg=#87afd7
        hi Error        guifg=#ff8787   guibg=#870000
        hi IncSearch                    guibg=#5fd7d7
        hi Search                       guibg=#d78700
        hi Todo         guifg=#d7d75f   guibg=#5f5f00


" ----------------------------------------------------------------------------
" Messages:
" ----------------------------------------------------------------------------

hi Question     guifg=fg
        hi ErrorMsg     guifg=#ff5f5f
        hi ModeMsg      guifg=#afd7d7
        hi MoreMsg      guifg=#afd7d7
        hi WarningMsg   guifg=#d7875f


" ----------------------------------------------------------------------------
" UI:
" ----------------------------------------------------------------------------

hi ColorColumn  guifg=NONE
hi Pmenu        guifg=bg
hi PmenuSel     guifg=fg
hi PmenuThumb   guifg=fg
hi StatusLine   guifg=bg
hi TabLine      guifg=bg
hi TabLineSel   guifg=fg
hi WildMenu     guifg=fg
    hi ColorColumn                  guibg=#3a3a3a
    hi CursorLineNr guifg=#9e9e9e   guibg=#444444
    hi FoldColumn                   guibg=#4e4e4e
    hi Folded                       guibg=#4e4e4e
    hi LineNr       guifg=#626262   guibg=#444444
    hi PmenuSel                     guibg=#005f87
    hi SignColumn                   guibg=#4e4e4e
    hi StatusLineNC guifg=#4e4e4e
    hi TabLineFill  guifg=#4e4e4e
    hi VertSplit    guifg=#626262
    hi WildMenu                     guibg=#005f87
        hi FoldColumn   guifg=#bcbcbc
        hi Folded       guifg=#bcbcbc
        hi Pmenu                        guibg=#b2b2b2
        hi PmenuSbar    guifg=#b2b2b2   guibg=#d0d0d0
        hi PmenuThumb                   guibg=#808080
        hi SignColumn   guifg=#b2b2b2
        hi StatusLine                   guibg=#b2b2b2
        hi StatusLineNC                 guibg=#b2b2b2
        hi TabLine                      guibg=#b2b2b2
        hi TabLineFill                  guibg=#b2b2b2
        hi TabLineSel                   guibg=#005f87
        hi VertSplit                    guibg=#b2b2b2


" ----------------------------------------------------------------------------
" Diff:
" ----------------------------------------------------------------------------

hi DiffAdd      guifg=fg
hi DiffChange   guifg=fg
hi DiffDelete   guifg=fg

hi DiffAdd                      guibg=#5f875f
hi DiffChange                   guibg=#87875f
hi DiffDelete                   guibg=#875f5f
hi DiffText                     guibg=#87875f
hi DiffText     guifg=#ffff87


" ----------------------------------------------------------------------------
" Spelling:
" ----------------------------------------------------------------------------

    hi SpellBad     guisp=#ff5f5f
    hi SpellCap     guisp=#5fafd7
    hi SpellLocal   guisp=#d7af5f
    hi SpellRare    guisp=#5faf5f


" ----------------------------------------------------------------------------
" Miscellaneous:
" ----------------------------------------------------------------------------

hi Ignore       guifg=bg
hi Underlined   guifg=fg


" ============================================================================
" Text Emphasis:
" ============================================================================

for s:item in s:bold_items
    exec "hi " . s:item . " gui=bold cterm=bold term=none"
endfor

for s:item in s:underline_items
    exec "hi " . s:item . " gui=underline cterm=underline term=none"
endfor
for s:item in s:undercurl_items
    exec "hi " . s:item . " cterm=underline"
endfor

for s:item in s:undercurl_items
    exec "hi " . s:item . " gui=undercurl term=none"
endfor


" ============================================================================
" Cterm Colors:
" ============================================================================

for s:item in s:normal_items + s:bold_items + s:underline_items
    call s:AddCterm(s:item)
endfor

for s:item in s:undercurl_items
    call s:AddSpCterm(s:item)
endfor

hi Normal ctermbg=NONE



" ============================================================================
" Plugin Specific Colors:
" ============================================================================

" Tagbar:
hi link TagbarAccessPublic Constant
hi link TagbarAccessProtected Type
hi link TagbarAccessPrivate PreProc

" Vimwiki:
hi link VimwikiHeader1 BIdentifier
hi link VimwikiHeader2 BPreProc
hi link VimwikiHeader3 BStatement
hi link VimwikiHeader4 BSpecial
hi link VimwikiHeader5 BConstant
hi link VimwikiHeader6 BType


" vim: tw=78
