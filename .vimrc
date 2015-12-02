" syncronised file from MacAir 14_08_08
" SETTINGS {{{1
" Pathogen allows to place plug-ins in folder 'bundle'
         if has("mac")
            execute pathogen#infect()
            Helptags
         endif

" for file-type detection
  filetype plugin on
" for Eclim
  filetype plugin indent on
" SETTINGS
 " turn off the menu-bar
 set go-=T
 
 colorscheme morning
 "blue freya desert mayansmoke
 

 set wildmenu               " show options on "tab"
 set hlsearch               " search highlighting
 set number                 " line numbering
"  highlight LineNr term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=DarkGray guibg=NONE           "tone down the numbers
 set linebreak              " do break words across lines
 set textwidth=0            " avoid long lines being broken
 set list
 set autoread               "avoids having to confirm "reload file" message
 set listchars=tab:▸\       "show tabs as little arrows
 ",eol:¬

 highlight NonText guifg=#bbbbbb guibg=NONE         "this applies to ??
 highlight SpecialKey guifg=#bbbbbb guibg=NONE      " this applies to "tabs"
 
 "hi NonText guifg=bg       " turn off the ~ on blank lines
 hi clear SpellBad
 hi clear SpellLocal
 hi SpellBad cterm=underline gui=undercurl,italic guifg=Black       " on cterm underline typos (don't make then dark red)
 hi SpellLocal cterm=underline
 set tabstop=4
 set shiftwidth=4
 "set expandtab

"Search 
 set incsearch
 set ignorecase

 " SPELLING {{{1
 " set up spell checker
 set spell
 set spelllang=en_gb
 command! German    set spelllang=de
 command! English   set spelllang=en_gb 

 set statusline=b%-10.3n\%=%f           " show buffer number in status bar (%-10.3n\) align rest right (%=) file name (%f)
 set foldtext=CustomFoldText()          " Custom fold defined in: ~/.vim/after/plugin/pg_foldtext.vim

" PATHS and EXTENSIONS
 set path+=.,~/
 
 set nocp                               " suggested for use with remote server via "scp:// phil@109.74.196.205//

if $VIM =~ 'vimtouch'
  " do some Android specific configuration here
    let $HOME = '/sdcard'
    so ~/.vim/bundle/vim-surround/plugin/surround.vim
    so ~/.vim/bundle/vim-exchange-master/plugin/exchange.vim
endif

cd ~/Documents/Text
" set path+=.,~/Dropbox/Text/
    set path+=.,~/Documents/
    set path+=.,~/Documents/Text/

 if has("mac")
    set path+=.,~/Dropbox/
    set path+=.,~/Documents/Software/Vim/
    set path+=.,~/Documents/Software/Processing/
    set path+=.,~/Dropbox/global_PyPad/**
    set path+=.,~/Documents/Oxford/**
    set path+=.,~/Documents/Mail/cenv0291/**
 endif

 set suffixesadd=.md,.tex,.txt          " search for extensions if none provided

" NERDTree settings {{{1
 let NERDTreeSortOrder=['\/$', '.md$', '.tex$', '*', '.dvi$']
 let NERDTreeIgnore = ['\.aux$','\.blg$','\.log$','\.out$','\.spl$','\.tmp$','\.idv$','\.4og$','\.4of$','\.4ot$','\.4os$','\.4oy$','\.4og$','\.4ct$','\.4oo$']

" MAPPINGS          {{{1
 " map {{{2
  " cycle through buffers
  noremap <RIGHT>   :w<CR>:bnext<CR>
  noremap <S-q>         :w<CR>:bd<CR>
  noremap <C-BS>        :bd!<CR>
  noremap <LEFT>        :w<CR>:bprevious<CR>
  noremap <C-LEFT>      :vertical resize -5<CR>
  noremap <C-RIGHT>     :vertical resize +5<CR>
  
  " Switch the default: move up visual lines unless g'ed
  noremap k gk
  noremap gk    k
  noremap j gj
  noremap gj    j
 
    " delete buffer but keep the split
    nmap <Leader>d :b#<bar>bd#<CR>
    
  " turn off search highlights temporarily with <C-l>
  noremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
  
  "Line up tables - 2 Spaces delimeter
  nnoremap <leader>tt     :Tab /\zs  \ze\S/<CR>

  " substitute the word under the cursor
  nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
  vnoremap <Leader>s :%s/'<,'>/
  
  "explore other files in path of the open file
  map <leader>e :e <C-R>=expand("%:p:h") . "/"<CR>

 " NMAP 
  nmap <leader>n        :NERDTreeToggle<CR>
  nmap <leader>r        :VimroomToggle<CR>
  " quick folding
  nmap <Space>      za
  
  " Save & normal mode
  imap <C-s>        <Esc>:update<CR>
  nmap <C-s>        :update<CR>
  
  " bring eof to centre
  nmap G Gzz
  " find next and bring to centre
  nmap n nzz
  
  nmap <leader>t "adi[da[:call SaveTag()<CR>a[]<ESC>
  nmap <leader>o :set iskeyword+=_ <CR>:let @a = join(readfile(expand("<cword>").".".expand("%:e")),"\n")<CR>f]"Ax"ap<ESC>
  
 " BUBBLE
   nmap <Up> ddkP
   nmap <Down> ddp
   " Bubble visually selected lines up or down `[V`] selected the pasted text
   " visually
   vmap <Up> xkP`[V`]
   vmap <Down> xp`[V`]

" FILES
 " insert FILE path and name
 nmap \fy :let @" = expand("%:p")<CR>p

 " reveal the path under cursor in Finder
 nmap \ff :!open -R <cWORD><CR>

 " add current file with timestamp to log file
 nnoremap <Leader>fn :<C-U>call WriteLog()<CR>
 
 "open file in window to the right
 nmap gf gf:vs#<CR>:vertical resize 45<CR><C-w>w
 nmap go :call OpenFile()<CR>
 nmap ge :call EmailFile()<CR>

" MATLAB                {{{3
":nmap <leader>m :!/Applications/MATLAB_R2011b.app/bin/matlab -nodesktop -nosplash -r "try, run %:p, pause, catch, end, quit" <CR> <CR>
nmap <leader>m :!/Applications/MATLAB_R2013a.app/bin/matlab -nodesktop -nosplash -r "try, run %:p, pause, catch, end" <CR> <CR>
" }}}

" PROCESSING                {{{3
" see /Users/pg1008/.vim/after/ftplugin/processing.vim
" }}}

" HIGHLIGHT                 {{{3
map \h :call Highlight()<CR>
vmap \h y\h
map \H :call UnHighlight()<CR>
vmap \H y\H
"}}}

" COPY to system clipboard (only needed when vim runs in terminal)
vmap <C-c> :w !pbcopy<CR><CR>

" VMAP
 "with visual highlight, surround with *, back to v mode and highlight
 "such that same selection can be surrounded with another round of stars
 " OBSOLETE with surround plugin
 "vmap <C-b> di*<ESC>pa*<ESC>T*vt*
 "vmap <C-i> di_<ESC>pa_<ESC>T_vt_
 vmap <C-r> di**\textcolor{red}{<ESC>pa}**
 " NOTE: to remove: ds*  or  ds_   (from surround plugin)
 " }}}
" IMAP
 " spell correction     CTRL-SPACE
 inoremap <C-Space>         <C-O>:call CorrectionFluid()<CR>
 inoremap <leader>s         <C-O>:call CorrectionFluid()<CR>
 
 " @l is the distance from end of line. @c returns to this point, which won't
 " have changed, even if the spell correction made the line longer or shorter.
 " A simple 'mark' would have been misplaced.
 " Multiline seem to count \n's -> nowrap during transaction
    " mx    mark the cursor position
    " [s    find most recent mistake
    " 1z=   correct with most common suggestion
    " `x    return to x
 function! CorrectionFluid()
    set nowrap
    normal mx
    let @l=col("$")-col(".")
    normal [s1z=
    let @/=expand("<cword>")
    normal `x
    let @c=col("$")-@l
    execute "normal @c|"
    set wrap
 endfunction
 
 imap ::        <Esc>:
 imap jj        <Esc>:silent update<CR>
 
 "auto underline
  inoremap --<CR> <Esc>kyyp<c-v>$r-o
  inoremap ==<CR> <Esc>kyyp<c-v>$r=o
 
 "auto completion
  imap <S-Space>        <C-n> 

" FUNCTIONS
 " HIGHLIGHT
  "write unnamed register to highlight file - then source to highlight it
  function! Highlight()
    let @"=substitute(strtrans(@"),'\^@','','g') 
    "let highlightStr = 'syn match philAction \"' . expand(@") . '\"'
    let highlightStr = '\"' . expand(@") . '\"'
    silent execute '!echo "'highlightStr'" >> %:r.hlt'
    call ShowHighlights()
  endfunction
  
  " delete lines containg the register string
  function! UnHighlight()
    let @"=substitute(strtrans(@"),'\^@','','g') 
    let pattern =  ' ".*' . expand(@") . '.*"'
    silent execute '!grep -v 'pattern' %:r.hlt > temp && mv temp %:r.hlt'
    call ShowHighlights()
  endfunction
  
  function! ShowHighlights()
    silent execute '!sed "s/^/syn match philAction/" %:r.hlt > %:r_.vim'
    set syntax=md
    so %:r_.vim
  endfunction


command! Ccal call AddContentToCalendar()<CR>
vmap <leader>c y:call AddContentToCalendar()<CR>

  function! AddContentToCalendar()
"getline(".")
    let temp=@m
    let @m=@"
    let @m=substitute(strtrans(@m),'\^@',' ','g')
    let description=@m
    let @m=""
    g/^Subject:/y M
    "remove line ends
    let @m=substitute(strtrans(@m),'\^@',' ','g')
    "let @m=substitute(@m,"\r*\n","","") 
    let title=substitute(@m,"Subject:","","")
    let shellcommand = '!xcal "' . title . '" "' . description . '"'
    execute shellcommand
  endfunction

 "Write file name to log.md                     {{{3
  function! WriteLog()
    let lfname = expand('%:p') . ' (' . strftime('%d %b %Y %H:%M') . ')'
    silent execute '!echo "'lfname'" > log.bkp && cat ~/Documents/Text/log.md >> log.bkp && mv log.bkp ~/Documents/Text/log.md'
    echomsg 'Wrote' lfname 'to log.md'
  endfunction

 "Tag Toggle
  fu! SaveTag()
    :set iskeyword+=_
    :call writefile(split(@a, "\n"),expand("<cword>").".".expand("%:e")) 
  endfu
  
  fu! ToggleTag()
    :set iskeyword+=_
    if filereadable(expand("<cword>").".".expand("%:e"))
        :let @a = join(readfile(expand("<cword>").".".expand("%:e")),"\n")
        f]"Ax"ap<ESC>
    else
        "adi[da[
        :call writefile(split(@a, "\n"),expand("<cword>").".".expand("%:e")) 
    endif
  endfu


 "Open File
  fu! OpenFile()
    " file is an email belonging to a calendar event
    if (match(expand("<cWORD>"),"\\d\\{12\\}\\.mail")!= -1)
        : !osascript -e 'tell app "Terminal"   do script "mutt -f /Users/pg1008/Documents/Mail/calendar_mail/<cWORD>"end tell'
    " file is an email
    elseif (match(expand("<cWORD>"),"\\/Mail\\/")!= -1)
        : !osascript -e 'tell app "Terminal"   do script "mutt -f <cWORD>"end tell'
    "check citation
    elseif filereadable("/Users/pg1008/Dropbox/Docs/".expand("<cword>").".pdf")
        :!open /Users/pg1008/Dropbox/Docs/<cword>.pdf
    elseif  filereadable("/Users/pg1008/Dropbox/fig/".expand("<cword>").".pdf")
        :!open /Users/pg1008/Dropbox/fig/<cword>.pdf
    elseif  filereadable("/Users/pg1008/Dropbox/fig/".expand("<cfile>"))
        :!open /Users/pg1008/Dropbox/fig/<cfile>
    else
        :!open <cfile> 
    endif
  endfu

 "Email File
  fu! EmailFile()
    "check for citation
    if filereadable("~/Dropbox/Docs/".expand("<cword>").".pdf")
        :!/Applications/calibre.app/Contents/MacOS/calibre-smtp --attachment ~/Dropbox/Docs/<cword>.pdf --relay smtp.gmail.com --port 587 --username annahgreenwood@gmail.com --password sunset89 --encryption-method TLS  annahgreenwood@gmail.com amazon_42358@kindle.com ""
    elseif  filereadable("~/Dropbox/Docs/".expand("<cword>").".pdf")
        :!/Applications/calibre.app/Contents/MacOS/calibre-smtp --attachment ~/Dropbox/fig/<cword>.pdf --relay smtp.gmail.com --port 587 --username annahgreenwood@gmail.com --password sunset89 --encryption-method TLS  annahgreenwood@gmail.com amazon_42358@kindle.com ""
    else
        :!/Applications/calibre.app/Contents/MacOS/calibre-smtp --attachment <cfile> --relay smtp.gmail.com --port 587 --username annahgreenwood@gmail.com --password sunset89 --encryption-method TLS  annahgreenwood@gmail.com amazon_42358@kindle.com ""
    endif
  endfu


inoremap <leader>' `'<ESC>i
inoremap <leader>{ {}<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>< <><ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>* **<ESC>i


" other {{{1
" for markdown folding
set nocompatible    
if has("auto cpd")
  filetype plugin indent on
endif
" end markdown folding

" ABBREVIATIONS                                 {{{2
inoremap <leader>__ <C-R>=strftime("%y_%m_%d_")<CR>
nnoremap <leader>__ i<C-R>=strftime("%y_%m_%d_")<CR>
cnoremap <leader>__ <C-R>=strftime("%y_%m_%d_")<CR>
ab ddate <C-R>=strftime("%d %b %y")<CR>
ab ttime <C-R>=strftime("%H:%M")<CR>
ab teh the
ab woudl would
ab shoudl should

ab phil@ philipp.grunewald@ouce.ox.ac.uk
ab cls@ Chris C.Llewellyn-Smith@physics.ox.ac.uk

" Commands {{{2
" open current file in Finder
command! Finder :!open -R %
command! Home cd ~/Documents/Text/
command! Do call ExecuteShellComand()
fu! ExecuteShellComand()
	let shellcommand = '!' . getline(".")
	execute shellcommand
endfu

command! UploadThisFolderToPhil call AddFolderToPhone()<CR>
fu! AddFolderToPhone()
    !adb push ./ /mnt/shell/emulated/0/Samsung/Music/
endfu
 
command! UnlockCENV0291  !rm /Users/pg1008/.offlineimap/cenv0291.lock
command! UnlockStrato  !rm /Users/pg1008/.offlineimap/strato.lock

command! Backup w %:r.bkp
" command! SyncToLinode !rsync -rz /Users/pg1008/Documents/Data/Linode/ root@109.74.196.205:/srv/www/
" command! SyncFromLinode   !rsync -rz root@109.74.196.205:/srv/www/ /Users/pg1008/Documents/Data/Linode/
command! SyncToLinode   !rsync -rz /Users/pg1008/Sites/distributed-energy.de/ root@109.74.196.205:/srv/www/distributed-energy.de/
command! SyncFromLinode !rsync -rz root@109.74.196.205:/srv/www/distributed-energy.de/ /Users/pg1008/Sites/distributed-energy.de/
command! BackupLinode   !rsync -rza --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} root@109.74.196.205:/ /Volumes/Phil2TRed/Linode/
command! BackupDatabaseLinode !mysqldump -h 109.74.196.205 -u phil -p --databases wp_db > ~/Documents/Data/SQL/Linode_wp_db.sql
command! BackupDatabaseMeter !mysqldump -h 109.74.196.205 -u phil -p --databases Meter > ~/Documents/Data/SQL/Linode_Meter.sql
command! BackupDatabaseEnergyLocal !mysqldump -h 109.74.196.205 -u phil -p --databases EnergyLocal > ~/Documents/Data/SQL/Linode_EnergyLocal.sql
command! RemoveDuplicateLines   g/^\(.*\)\n\1$/d

command! IncrementalNumbers  let i=1 | '<,'>g/^/ s//\=i/ | let i+=1
command! CALadd silent call VimCal()
fu! VimCal()
    let temp=@m
    let @m=""
    "get title - whole line after time as default

    normal 0f   l"my$
    let EventTitle=@m
    "if a location is given- yank from @ to end
    let EventLocation=" "
    let EventContent=" "
    let EventLine=getline(".")
    if (match(EventLine,"@")>-1)
        normal 0f@l"my$
        let EventLocation=@m
        normal 0f   l"myt@
        let EventTitle=@m
    endif
    if (match(EventLine,"\.")>-1)
        normal 0f   l"myt.
        let EventTitle=@m
        normal 0f.l"my$
        let EventContent=@m
    endif

    "Find the most recent line with a date in "01 Jan 14" format, then trim
    "any end off
    1,.g/\d\d\s\u\l\l\s\d\d/y m
    let @m=substitute(@m,"\\(\\d\\d\\s\\u\\l\\l\\s\\d\\d\\).*","\\1","g")
    let @m=substitute(@m," Jan ","/01/20","")
    let @m=substitute(@m," Feb ","/02/20","")
    let @m=substitute(@m," Mar ","/03/20","")
    let @m=substitute(@m," Apr ","/04/20","")
    let @m=substitute(@m," May ","/05/20","")
    let @m=substitute(@m," Jun ","/06/20","")
    let @m=substitute(@m," Jul ","/07/20","")
    let @m=substitute(@m," Aug ","/08/20","")
    let @m=substitute(@m," Sep ","/09/20","")
    let @m=substitute(@m," Oct ","/10/20","")
    let @m=substitute(@m," Nov ","/11/20","")
    let @m=substitute(@m," Dec ","/12/20","")
    let EventDate=@m
    let EventTime=substitute(EventLine,"\\(\\d\\d:\\d\\d\\).*","\\1","g")
    let EventEndTime=substitute(EventLine,"\\(\\d\\d:\\d\\d\\)-\\(\\d\\d:\\d\\d\\).*","\\2","")

    let @m=temp
    let sendCommand = '!osascript /Users/pg1008/Library/Scripts/Vim2Cal.scpt "' . EventDate . ' ' . EventTime . '" "' . EventTitle . '" "' . EventContent . '" "' . EventLocation . '" "'. EventDate . ' ' . EventEndTime . '"'
    silent execute sendCommand
    echo "Event '" . EventTitle . "' added to Calendar"
endfu


    "execute '!r ~/Documents/Text/calendar.ics'
    "execute '!cat ~/Library/Calendars/*/*/*.ics ~/Library/Calendars/970DFC89-69D9-4465-BBB5-4F2711E3B7C4.caldav/4AA4583C-A5E5-4265-B773-9E50573FE953.calendar/Events/*.ics >> ~/Documents/Text/calendar.ics'


command! -nargs=* Cal silent call Calist(<f-args>)
fu! Calist(...)
    if (a:0==0)
        let a:weeks=2
    else
        let a:weeks=a:1
    endif
    let endtime = system('gdate -d "'.strftime("%d %b %y").' + '.a:weeks.' weeks" +%d\ %b\ %Y')
    let endtime = substitute(endtime,"\n","","")
    let command = '!gcalcli agenda "'.strftime("%d %b %Y").'" "'.endtime.'" --details description --detail_description_width 45 --nocolor --nolineart --cal="work" > cal.md'
    silent execute command
    vs
    e! cal.md
    %s/\u\l\l \u\l\l \d\d\zs \ze/\r----------\r/
    %s/^ \+/\t/
    %g/Description:/d
    setlocal nowrap
    w
endfu

command! -nargs=* CALENDAR silent call CalendarList(<f-args>)
fu! CalendarList(...)
    if (a:0==0)
        let a:days=7
    else
        let a:days=a:1
    endif
    execute '!rm ~/Documents/Text/calendar'
    execute '!cp ~/Documents/Text/blankCalendar ~/Documents/Text/calendar'
    execute '!rm ~/Documents/Text/calendar.ics'
    execute '!curl "https://www.google.com/calendar/ical/8vps9g15s9vnespmnmi5nen9c8\%40group.calendar.google.com/private-5d8597929307ee9c5f1926e9b2c75e63/basic.ics" -o ~/Documents/Text/calendar.ics'
    execute '!calcurse -c ~/Documents/Text/calendar -i ~/Documents/Text/calendar.ics'
    execute '!calcurse -r'.a:days.' -c ~/Documents/Text/calendar --format-apt="\%S \t \%m\n" > ~/Documents/Text/calendar.md'
    "vs
    e! ~/Documents/Text/calendar.md
    %s/\(^\d\d\/\d\d\/\d\d\):/\=substitute(system('gdate  +"%a - %d %b %g" -d '.submatch(1)),'\n','\n--------','g')/e
    %s///ge
    normal gg
endfu

command! AR call ActionList()

fu! ActionList()
    vimgrep /^AR/j *.md
    copen
endfu

command! MeanColumn2 silent call GetMean()

fu! GetMean()
e %:r.csv
let g:S = 0  "result in global variable S
%s/\zs\d\+\.\d\ze\n/\=Sum(submatch(0))/g
let @" = "\nDuration: " . line('$')/3600 . " hours\nMean: ". g:S/line('$') . " Watt"
e! %:r.meta
normal G$p
endfu

function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction

"Save buffer with first line as file name
command! Save call SaveFirstLine()
function! SaveFirstLine ()
    let fileName = strftime("%y_%m_%d_") . substitute(getline(1),"@","_","g")
    execute 'sav! '.substitute(fileName," ","_","g").'.md'
endfunction 

function! SaveDraftMail()
    let fileName = strftime("%y_%m_%d_%H_%M") 
    execute 'sav! ~/Documents/Text/Mail/' . fileName . '_draft.mail'
endfunction 

" Change to the directory of the current file
command! PWD :cd %:p:h

" open in PDF viewer (if file exists)
command! PDF :silent !open %:r.pdf
command! DOC :silent !open %:r.docx

command! WordCount :w !wc -w  " use g-<C>g
command! Delete :call DeleteFile()
fu! DeleteFile()
    !mv % ~/.Trash/ 
    bd
endfu

command! AdbSyncVim :!adb push  ~/.vim /sdcard/.vim
command! AdbSyncVimrc :!adb push  ~/.vimrc /sdcard/

" compile and upload Android project
command! AdbUninstallDeMon :!adb uninstall com.Phil.DEMon
command! AdbDebugDeMon :cd ~/Documents/Software/Android/DMon/ | !ant debug
command! AdbInstallDeMon :!adb install ~/Documents/Software/Android/DMon/bin/MainActivity-debug.apk
command! AdbGetData :!adb pull /sdcard/METER/ ~/Documents/Data/METER/
command! AdbInstallStarter :!adb install /Users/pg1008/Documents/Software/Android/AutoStart_2.1.apk
" Gnu plot a CSP file time series
"command! GNUmeter !gnuplot -e "filename='%'" /Users/pg1008/Documents/Software/gnuplot/template_meter.gp
command! GNUmeter silent call GnuMake("meter")
command! GNUplot call GnuMake("default")
command! GNUedit vs %:r.gp
command! MetaEdit vs %:r.meta

" get the content after "item: " from the file in the arglist
fu! GetIniItem(item)
        let temp=@x
        let @x=''
        let myRegex = '^' . a:item . ':\s\?'
        let command='argdo g/' . myRegex . '/y x'
        execute command
        let @x = substitute(@x,myRegex,"","g")
        let @x="'".substitute(@x,"\r*\n","","")."'"
        return @x
        let @x=temp
        unlet temp
endfu

fu! GnuMake(plotType)
    let @d = "e " . expand('%')
    if !filereadable(expand('%:r').".gp")
        if (a:plotType =="meter")
         !cp /Users/pg1008/Documents/Software/gnuplot/template_meter.gp %:r.gp
        else
         !cp /Users/pg1008/Documents/Software/gnuplot/template.gp %:r.gp
        endif
    endif
    if filereadable(expand('%:r').".meta")
        args %:r.meta
        let xlabelText= GetIniItem('X label')
        let ylabelText= GetIniItem('Y label')
        let titleText= GetIniItem('Title')
        let PVfile= GetIniItem('PV file')
        execute @d
    else
        let xlabelText= "''"
        let ylabelText= "''"
        let titleText= "''"
    endif
    let filename="'".expand('%')."'"
    let filenameonly="'".expand('%:r')."'"
    let gnucommand ='!gnuplot -e "filename=' . filename . '; filenameonly=' . filenameonly . '; PVfile=' . PVfile . '; xlabelText=' . xlabelText .  '; ylabelText=' . ylabelText . '; titleText=' . titleText . '" %:r.gp'
    execute gnucommand
endfu

command! PhotoShare !/Applications/Phoshare.app/Contents/MacOS/Phoshare --foldertemplate "{name}" --nametemplate "{yyyy}_{mm}_{dd}" -u -s Rated_12months --iphoto /Volumes/Phil2T/iPhoto\ Library --export ~/Dropbox/pics
"eject MyPassport 
command! Eject !hdiutil eject /Volumes/Phil_red | hdiutil eject /Volumes/Phil2T
" Backup pwd to Dropbox
"command! Rsync !rsync -a %:p:h /Users/pg1008/Dropbox/Vim/
command! Rsync !rsync -a % /Users/pg1008/Dropbox/Vim/
" Get comments from Kindle
command! Kindle !rsync -a /Volumes/Kindle/documents/My\ Clippings.txt /Users/pg1008/Documents/Text/KindleNotes.txt

"command! HiddenFiles !defaults write com.apple.Finder AppleShowAllFiles TRUE && killall Finder
command! HiddenFiles !defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder
"command! HiddenFilesOff !defaults write com.apple.Finder AppleShowAllFiles FALSE && killall Finder
command! HiddenFilesOff !defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder

"command INDESIGN

 command! InDesign call VimInDesign()
 fu! VimInDesign()
    let sendCommand = '!pandoc -s --number-sections --biblio ~/Dropbox/PG_bib.bib -f markdown -t icml -o %:r.icml %'
    execute sendCommand
    let Filename = expand('%:t:r')
    "let @a = expand('%:p:h')
    "let @a = substitute(@a,"\/",":","g")
    let Filepath = expand('%:p:h')
    let Filepath = substitute(Filepath,"\/",":","g")
    let sendCommand = '!osascript /Users/pg1008/Library/Scripts/md2InDesign.scpt "' . Filepath .  '" "' . Filename . '"'
    execute sendCommand
 endfu 


 command! Attach call GetFinderSelection()

 fu! GetFinderSelection()
     " copy Finder selection to clipboard, trim to one file per line and paste
     :silent !osascript -e 'tell application "Finder" set sel to the selection as text set the clipboard to POSIX path of sel end tell'
     let @* = substitute(@*,'Macintosh HD','\n','g')
     normal "*p
 endfu
" Mail {{{2
 command! Mail call VimMail()
 command! NewMail cd ~/Documents/Text/Mail/ | e temp.mail 
 

 fu! VimMail()
    "/Users/pg1008/Library/Containers/com.apple.mail/Data/Library/SyncedPreferences/com.apple.mail-com.apple.mail.recents.plist
    ".addresses
    let sentMessageFile = '~/Documents/Text/Mail/' . strftime("%y_%m_%d_%H_%M") . '_sent.mail'
    " silent w! ~/Documents/Text/Mail/last_message.mail
	execute 'silent w! ' . sentMessageFile
    let Message=""
    let SendTo=""
    let SendCC=""
    let Attach=""
    let Subject=""
    let sendCommand=""
    call CleanRTF()

    let temp=@m
    let @m=""
    silent! 1g/@/y m
    let SendTo=@m
    let SendTo=substitute(SendTo,"","","g")
    let SendTo=substitute(SendTo," ","","g")
	silent! 1g/@/d

    let @m=""
	" only if this is an email address does @m get populated
    silent! 1g/@/y m
    let SendCc= "-c \"" . @m . "\""
    let SendCc=substitute(SendCc,"","","g")
    " let SendCc=substitute(SendCc," ","","g")
	" remove the '-c' in case this is the subject line
	silent! 1g/@/d

    let Subject=getline(1)

    "get Attachments (leading /...)
    let @m=""
    silent! %s/^\//-a \//
    " every new line is a new attachement - with a leading '-a'
    silent! g/^-a \//y M
    silent! g/^-a \//d

    let @m=substitute(@m,"\n"," ","g")
    let @m=substitute(@m,"^,","","")
    let Attach=substitute(@m,",$","","")

    let @m=temp

    "get Message
    let outFile='~/Documents/Text/mail/out.mail'
    silent 2,$w! ~/Documents/Text/mail/out.mail

    let sendCommand = '!mutt -s "'.Subject.'" ' . SendTo  .' '. SendCc . ' ' . Attach .' < ' . outFile
    let sendCommand = substitute(sendCommand,"\n","","g")
    execute 'silent! ' sendCommand
    echo "Message '" . Subject . "' sent to " . SendTo
	execute 'silent e! ' sentMessageFile
 endfu
 
 fu! CleanRTF()
    silent! %s/"/'/g
    silent! %s/Ê/ /g
    silent! %s/á/- /g
    silent! %s//\r/g
    silent! %s/Õ/'/g
    silent! %s/Õ/'/g
    silent! %s/É/...Q/g
    silent! %s/Ð/-/g
    silent! %s//ü/g
 endfu


" start screen {{{2
 command! Start find log.md
 command! Restore source session.vim
 
 if has("autocmd")
     augroup PhilsAutoCommands
         autocmd!
         " AUTO commands
         if has("mac")
             au BufRead,BufNewFile *.md set filetype=pandoc
         else
             au BufRead,BufNewFile *.md set filetype=mkd
             au BufRead,BufNewFile *.md set syntax=mkd
             au BufRead,BufNewFile *.md so ~/.vim/after/ftplugin/mkd.vim
             au BufRead,BufNewFile *.md so ~/.vim/after/syntax/mkd.vim
         endif

         " MAil
         au BufRead,BufNewFile *.mail set filetype=mail
         au BufRead,BufNewFile *.mail set syntax=mail
         au BufRead,BufNewFile temp.mail call SaveDraftMail()
         au BufRead,BufNewFile /private/var* set syntax=mail


         au BufRead,BufNewFile *.plist set filetype=plist
         au BufRead,BufWrite log.md %s/^\s\?\/Users\/pg1008\/Documents\///e
         au BufRead,BufWrite log.md %s/^\s\?\/Software\/Processing\///e
         au BufRead,BufWrite log.md %s/^\s\?\/storage\/emulated\/legacy\/Documents\///e

         autocmd VimLeave * :mksession! ~/Documents/Text/session.vim
         " autocmd VimEnter * :source ~/Documents/Text/session.vim
         autocmd bufwritepost .vimrc source $MYVIMRC
     augroup END
 endif

so ~/.vim/phil.vim      " loads grey line numbers and tabs
