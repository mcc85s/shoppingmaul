
    $Name             = "server.cfg"
    $FilePath         = "quake3.exe"
    # $ArgumentList   = "+set dedicated 2 +set net_port 27970 +com_hunkMegs 50 +exec $Name"
    $ArgumentList     = "+set fs_game arena +set vm_game 0 +set sv_pure 1 +set bot_enable 0 +set sv_punkbuster 1 +set dedicated 2 +set net_port 27960 +com_hunkMegs 50 +exec $Name"
    $WorkingDirectory = "${env:ProgramFiles(x86)}\Quake III Arena"

$CTF = @'
// CTF
g_gametype 4
map 20kctf1
fraglimit 0
timelimit 20
set d1 "map 20kctf1 ; set nextmap vstr d1"
set b1 "addbot xaero 5 red 5"
set b2 "addbot hunter 5 blue 5
set b3 "addbot major 5 red 5"
set b4 "addbot sarge 5 blue 5"
set b5 "addbot wrack 5 red 5"
'@

$FFA = @'
// FFA
g_gametype 0
map 20kdm1
fraglimit 50
timelimit 20
set d1 "map 20kdm1 ; set nextmap vstr d2"
set d2 "map 20kdm2 ; set nextmap vstr d3"
set d3 "map 20kdm3 ; set nextmap vstr d1"
set b1 "addbot xaero 5 5"
set b2 "addbot hunter 5 5
set b3 "addbot major 5 5"
set b4 "addbot sarge 5 5"
set b5 "addbot wrack 5 5"
'@

$RA3 = @'
set d1 "map hellra3map1; set nextmap vstr d1"
fraglimit 50
timelimit 20
'@

    $Config           = @"
sv_maxclients 16
sv_hostname "<|3FG20K>'s Shopping Maul"
g_motd "Test server"
sv_privateClients 1
sv_privatePassword "password"
rconpassword "password"
sv_pure 1
sv_maxRate 25000
sv_master2 ""
sv_master3 ""
sv_master4 ""
sv_master5 ""
g_weaponrespawn 5
g_allowvote 1
g_quadfactor 3
g_syncronousClients 1
sets "Administrator" "<|3FG20K>"
sets "Email" "sdp12065@gmail.com"
sets "URL" "http://www.securedigitsplus.com""
sets "Location" "Clifton Park, NY"
sets "CPU" "Dual Xeon"
sets "mappack" "[(..::LvL)]"
$RA3
vstr d1
vstr b1
vstr b2
vstr b3
vstr b4
vstr b5
"@
    $ConfigPath       = "$WorkingDirectory\baseq3\$Name"
    Set-Content -Path $ConfigPath -Value $Config -EA 0

Start-Process -FilePath quake3.exe -ArgumentList $ArgumentList -WorkingDirectory "${env:ProgramFiles(x86)}\Quake III Arena"
