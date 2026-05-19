#!/usr/bin/env bash
# connect.sh - Explore old-school systems on the internet
# Usage: ./connect.sh [name|list|menu|random]
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; MAGENTA='\033[0;35m'
BOLD='\033[1m'; NC='\033[0m'

# ─── System definitions ───────────────────────────────────────────────────
# Format: name|category|description|hint|command
SYSTEMS=()
add_system() { SYSTEMS+=("$1|$2|$3|$4|$5"); }

# ── Pubnixes (Public Access Unix) ──
add_system "sdf"     "Pubnixes" \
  "SDF Public Access UNIX System — free shell accounts since 1987" \
  "Use: ${BOLD}ssh -l newuser sdf.org${NC} to register. After registering, just ssh sdf.org with your new username." \
  "ssh -l newuser sdf.org"

add_system "sdf-login" "Pubnixes" \
  "SDF — connect with YOUR account (already registered)" \
  "Use: ${BOLD}ssh sdf.org${NC} once you have an account. SDF offers: ARPA services, email, gopher, finger, games." \
  "ssh sdf.org"

add_system "freeshell" "Pubnixes" \
  "Freeshell.org — SDF's free shell (same system family)" \
  "Use: ${BOLD}ssh -l newuser freeshell.org${NC} to register (same as SDF). Once registered, use your own username." \
  "ssh -l newuser freeshell.org"

add_system "panix"    "Pubnixes" \
  "PANIX — Public Access Unix since 1989, NYC. One of the oldest. NetBSD." \
  "Use: ${BOLD}ssh shell.panix.com${NC} (any user? try 'guest' or contact them). Founded 1989 — older than Linux!" \
  "ssh shell.panix.com"

add_system "grex"     "Pubnixes" \
  "Grex — free public UNIX since 1991, Ann Arbor MI. OpenBSD. Nonprofit." \
  "Use: ${BOLD}ssh -l newuser grex.org${NC} to register (like SDF). Free shell accounts since 1991! Email, games, conferencing." \
  "ssh -l newuser grex.org"

add_system "grex-login" "Pubnixes" \
  "Grex — connect with YOUR account (already registered)" \
  "Use: ${BOLD}ssh grex.org${NC} once registered." \
  "ssh grex.org"

add_system "oss-zone" "Pubnixes" \
  "oss.zone — free-to-use pubnix running NixOS. Web hosting, community." \
  "Use: ${BOLD}ssh oss.zone${NC}. Free sign-up. Runs NixOS. Web: https://oss.zone" \
  "ssh oss.zone"

add_system "dimension-sh" "Pubnixes" \
  "dimension.sh — free Linux pubnix with email, gopher, gemini." \
  "Use: ${BOLD}ssh dimension.sh${NC}. Free shell, email, static file hosting, gopher, gemini." \
  "ssh dimension.sh"

add_system "chunboan" "Pubnixes" \
  "chunboan.zone — neo (2025) pubnix with gemini, gopher, snac." \
  "Use: ${BOLD}ssh chunboan.zone${NC}. Debian-based, gemini, gopher, snac fediverse." \
  "ssh chunboan.zone"

# ── Tilde Clubs ──
add_system "tilde-club" "Tilde Clubs" \
  "Tilde.Club — the original tilde community. SSH, gopher, finger, email, IRC, gemini." \
  "Use: ${BOLD}ssh tilde.club${NC}. A modern take on the pubnix concept. Web: https://tilde.club" \
  "ssh tilde.club"

add_system "tilde-team" "Tilde Clubs" \
  "Tilde.Team / Tildeverse — full-featured tilde community." \
  "Use: ${BOLD}ssh tilde.team${NC}. Also available on port 2222. Has gopher, finger, irc, email." \
  "ssh tilde.team"

add_system "tilde-town" "Tilde Clubs" \
  "Tilde.Town — creative tilde community with art/writing focus." \
  "Use: ${BOLD}ssh tilde.town${NC}. Known for its creative residents. Gopher, finger, gemini." \
  "ssh tilde.town"

add_system "tilde-institute" "Tilde Clubs" \
  "Tilde.Institute — tilde club hosted in Germany." \
  "Use: ${BOLD}ssh tilde.institute${NC}. Hetzner-hosted, gopher+finger." \
  "ssh tilde.institute"

add_system "thunix"   "Tilde Clubs" \
  "Thunix — pubnix / tilde community with full services." \
  "Use: ${BOLD}ssh thunix.net${NC}. SSH also on port 2222. Gopher, finger, email, gemini." \
  "ssh thunix.net"

add_system "vern"     "Tilde Clubs" \
  "Vern.cc — THE most full-featured pubnix: telnet+ssh+rlogin+dict+irc+icecast+rsync+gemini" \
  "Use: ${BOLD}ssh vern.cc${NC} or ${BOLD}telnet vern.cc${NC} or even ${BOLD}rlogin vern.cc${NC}. Has a dict server on port 2628 and Icecast streaming on 8533!" \
  "ssh vern.cc"

# ── Vintage / Simulation ──
add_system "telehack" "Vintage" \
  "Telehack — simulation of 1980s ARPANET computing. Classic games, BBS, old commands." \
  "Just ${BOLD}telnet telehack.com${NC} (or port 23). Type 'help' when you connect. Simulates early Unix." \
  "telnet telehack.com"

# ── Games ──
add_system "morgengrauen" "Games" \
  "MorgenGrauen — the largest German text-based online RPG (MUD). Since 1992." \
  "Use: ${BOLD}telnet mg.mud.de${NC} or ${BOLD}telnet mud.morgengrauen.info${NC}. German-language MUD. One of the oldest." \
  "telnet mg.mud.de"

add_system "silberland" "Games" \
  "Silberland — German LP-MUD running since 1996. Fantasy theme." \
  "Use: ${BOLD}telnet mud.silberland.at 4711${NC}. Austrian LP-MUD. Quests, houses, in-game mail." \
  "telnet mud.silberland.at 4711"

add_system "fics"     "Games" \
  "FICS — Free Internet Chess Server. Play chess against humans and computers." \
  "Use: ${BOLD}ssh freechess.org${NC} or ${BOLD}telnet freechess.org${NC}. Type 'help' or 'who' when connected." \
  "ssh freechess.org"

add_system "fics-tel" "Games" \
  "FICS — via telnet (if SSH port is blocked)" \
  "Telnet: ${BOLD}telnet freechess.org${NC} port 23. Same server." \
  "telnet freechess.org"

add_system "nethack4" "Games" \
  "NetHack 4 — play the classic dungeon-crawling roguelike in your terminal." \
  "Use: ${BOLD}ssh nethack4.org${NC}. The definitive roguelike. Been around since 1987." \
  "ssh nethack4.org"

add_system "nethack4-tel" "Games" \
  "NetHack 4 — via telnet" \
  "Telnet: ${BOLD}telnet nethack4.org${NC}." \
  "telnet nethack4.org"

add_system "nanvaent" "Games" \
  "Nanvaent MUD — text-based virtual world (Multi-User Dungeon)." \
  "Use: ${BOLD}telnet lost.nanvaent.org${NC}. One of the few classic MUDs still running." \
  "telnet lost.nanvaent.org"

add_system "darkcastle" "Games" \
  "Dark Castle MUD — DIKU MUD running since 1992! Free fantasy RPG." \
  "Use: ${BOLD}telnet dcastle.org${NC}. Also on ports 6666 and 6969. Quests, clans, PvP, casino." \
  "telnet dcastle.org"

add_system "empiremud" "Games" \
  "EmpireMUD — map-based CircleMUD sandbox. Build your empire!" \
  "Use: ${BOLD}telnet empiremud.net 4000${NC}. 142k+ rooms, 280+ skills, building/crafting." \
  "telnet empiremud.net 4000"

add_system "prophecy-mud" "Games" \
  "Prophecy MUD — set in David Eddings' Belgariad universe. Since 1995." \
  "Use: ${BOLD}telnet mud.prophecy.lu 4000${NC}. Luxembourg-based MUD." \
  "telnet mud.prophecy.lu 4000"

add_system "rit-games" "Games" \
  "RIT CSH Games — nethack server at Rochester Institute of Technology." \
  "Use: ${BOLD}telnet games-ng.csh.rit.edu${NC}. Run by RIT's Computer Science House." \
  "telnet games-ng.csh.rit.edu"

# ── Communities ──
add_system "timeheart" "Communities" \
  "Timeheart — community system accessible via telnet and SSH." \
  "Use: ${BOLD}ssh connect.timeheart.net${NC} or telnet connect.timeheart.net. SSH also on port 2222." \
  "ssh connect.timeheart.net"

# ── BBS Systems ──
add_system "vert-bbs" "BBS" \
  "Vertrauen BBS — the flagship Synchronet BBS, run by the software's author." \
  "Use: ${BOLD}telnet vert.synchro.net${NC}. One of THE classic telnet BBSes still running." \
  "telnet vert.synchro.net"

add_system "synchro-bbs" "BBS" \
  "Synchronet BBS — home of the Synchronet BBS software project." \
  "Use: ${BOLD}telnet synchro.net${NC}. Git repos, wiki, and BBS all on one host." \
  "telnet synchro.net"

add_system "dsbbs" "BBS" \
  "DataStream BBS — Synchronet v3.20" \
  "Use: ${BOLD}telnet dsbbs.net${NC}. Also has rlogin on port 513." \
  "telnet dsbbs.net"

add_system "amigacity" "BBS" \
  "Amiga City BBS — Amiga-themed Synchronet BBS with retro protocol support." \
  "Use: ${BOLD}telnet amigacity.xyz${NC}. SSH also available. Gopher, finger, IRC, rlogin." \
  "telnet amigacity.xyz"

add_system "macretro" "BBS" \
  "Classic Macs BBS — Retro Mac OS themed BSS with VNC!" \
  "Use: ${BOLD}telnet macos.retro-os.live${NC}. SSH also available. Has a VNC server for retro Mac desktop!" \
  "telnet macos.retro-os.live"

add_system "c3bbs" "BBS" \
  "C3BBS Retro Networking — full retro BBS in Germany." \
  "Use: ${BOLD}telnet c3bbs.retronetworking.org${NC}. SSH, gopher, finger, rlogin, NNTP." \
  "telnet c3bbs.retronetworking.org"

add_system "eotlbbs" "BBS" \
  "End of the Line BBS — classic telnet BBS." \
  "Use: ${BOLD}telnet bbs.endofthelinebbs.com${NC}." \
  "telnet bbs.endofthelinebbs.com"

add_system "fido-bajtek" "BBS" \
  "Fido Bajtek — Fidonet BBS in Poland." \
  "Use: ${BOLD}telnet fido.bajtek.org${NC}. Fidonet — the classic BBS network." \
  "telnet fido.bajtek.org"

add_system "falcon-bbs" "BBS" \
  "Falcon BBS — Fidonet node in Amsterdam." \
  "Use: ${BOLD}telnet bbs.falconbbs.nl${NC}. Also a Fidonet node." \
  "telnet bbs.falconbbs.nl"

add_system "ftelnet" "BBS" \
  "fTelnet Demo BBS — Synchronet v3.20 with web telnet client." \
  "Use: ${BOLD}telnet ftelnet.synchro.net${NC}. Also accessible via web at port 8080/8443." \
  "telnet ftelnet.synchro.net"

add_system "bbs-tul" "BBS" \
  "LIANE BBS — Czech BBS running on Apache 1.3.12 (old!)" \
  "Use: ${BOLD}telnet bbs.tul.cz${NC}. Web interface too. VERY old Apache — vintage." \
  "telnet bbs.tul.cz"

add_system "telephreak" "BBS" \
  "Telephreak BBS — has finger service too." \
  "Use: ${BOLD}telnet bbs.telephreak.org${NC}. Also has finger on port 79." \
  "telnet bbs.telephreak.org"

add_system "enigma-bbs" "BBS" \
  "Enigma BBS." \
  "Use: ${BOLD}telnet enigma-bbs.com${NC}." \
  "telnet enigma-bbs.com"

add_system "darkages" "BBS" \
  "Dark Ages BBS." \
  "Use: ${BOLD}telnet darkagesbbs.com${NC}." \
  "telnet darkagesbbs.com"

add_system "magnum" "BBS" \
  "Magnum BBS." \
  "Use: ${BOLD}telnet magnumbbs.net${NC}." \
  "telnet magnumbbs.net"

add_system "warpstream" "BBS" \
  "WarpStream BBS — also has gopher, finger, rlogin." \
  "Use: ${BOLD}telnet warpstream.org${NC}." \
  "telnet warpstream.org"

add_system "dragonsweb" "BBS" \
  "Dragon's Web BBS." \
  "Use: ${BOLD}telnet bbs.dragonsweb.org${NC}." \
  "telnet bbs.dragonsweb.org"

add_system "kingdomsend" "BBS" \
  "Kingdom's End — Synchronet BBS." \
  "Telnet: kingdomsend.synchronetbbs.org port 23." \
  "telnet kingdomsend.synchronetbbs.org"

add_system "seaoffantasy" "BBS" \
  "Sea of Fantasy — Synchronet BBS." \
  "Telnet: seaoffantasy.synchronetbbs.org port 23." \
  "telnet seaoffantasy.synchronetbbs.org"

add_system "weednet" "BBS" \
  "WeedNet — Synchronet BBS." \
  "Telnet: weednet.synchronetbbs.org port 23." \
  "telnet weednet.synchronetbbs.org"

add_system "deadinternet" "BBS" \
  "Dead Internet — Synchronet BBS." \
  "Telnet: deadinternet.synchronetbbs.org port 23." \
  "telnet deadinternet.synchronetbbs.org"

add_system "paradoxbbs" "BBS" \
  "Paradox BBS — Synchronet BBS." \
  "Telnet: paradoxbbs.synchronetbbs.org port 23." \
  "telnet paradoxbbs.synchronetbbs.org"

add_system "ohb-bbs" "BBS" \
  "OHB BBS — Synchronet BBS." \
  "Telnet: ohb.synchronetbbs.org port 23." \
  "telnet ohb.synchronetbbs.org"

add_system "lsnet-bbs" "BBS" \
  "LSNET archive / BBS." \
  "Telnet: bbs.lsnet.dev port 23. Also has gopher, finger, rlogin." \
  "telnet bbs.lsnet.dev"

add_system "fleethq" "BBS" \
  "Fleet HQ BBS." \
  "Telnet: bbs.fleethq.org port 23." \
  "telnet bbs.fleethq.org"

add_system "amigacity-ssh" "BBS" \
  "Amiga City BBS — via SSH instead of telnet." \
  "Use: ${BOLD}ssh amigacity.xyz${NC}." \
  "ssh amigacity.xyz"

add_system "macretro-ssh" "BBS" \
  "Classic Macs BBS — via SSH. (Also has VNC!)" \
  "Use: ${BOLD}ssh macos.retro-os.live${NC}." \
  "ssh macos.retro-os.live"

add_system "digitaldistortion" "BBS" \
  "Digital Distortion BBS — telnet+ssh+gopher+finger+rlogin+irc" \
  "Telnet: digitaldistortionbbs.com. Full retro protocol support." \
  "telnet digitaldistortionbbs.com"

add_system "mycrowd-bbs" "BBS" \
  "MyCrowd BBS — has finger and rlogin too." \
  "Telnet: bbs.mycrowd.ca. SSH and rlogin also available." \
  "telnet bbs.mycrowd.ca"

add_system "slumberland" "BBS" \
  "Slumberland BBS — at qixl.jx.io." \
  "Telnet port 23. SSH also available." \
  "telnet qixl.jx.io"

add_system "outerwall" "Citadel" \
  "The Outer Wall — Citadel messaging/BBS system." \
  "Telnet outerwall.net port 23. Citadel messaging server." \
  "telnet outerwall.net"

add_system "4d2org" "BBS" \
  "4d2.org BBS — Synchronet BBS, Portland OR. Nonprofit retro community." \
  "Telnet ${BOLD}bbs.4d2.org${NC} or SSH same host. Also has gopher:70, finger:79, IRC. Dial-up too!" \
  "telnet bbs.4d2.org"

add_system "aliens-alcove" "BBS" \
  "Aliens' Alcove! 2 BBS — WWIV BBS in the Philippines. Since 1992." \
  "Telnet ${BOLD}aliens.free.net.ph${NC} or ${BOLD}newt.aliens.ph${NC}. WWIV on Linux, FidoNet node." \
  "telnet aliens.free.net.ph"

add_system "bartsplace" "BBS" \
  "Bartsplace — Commodore-themed BBS with Airport door game!" \
  "Telnet ${BOLD}bartsplace.net${NC}. Classic Commodore BBS by Bart van Leeuwen (Netherlands)." \
  "telnet bartsplace.net"

add_system "cbbs-tn" "Vintage" \
  "CBBS/TN — THE FIRST BBS EVER (1978!), running on AltairZ80 hardware." \
  "Telnet ${BOLD}cbbs.mitsaltair.com 8800${NC}. Ward Christensen's original BBS. Historic." \
  "telnet cbbs.mitsaltair.com 8800"

# ── Oddities & Novelty ──
add_system "m68k-club" "Oddities" \
  "68k Mac Club — community for classic Mac enthusiasts. SSH+gopher+gemini." \
  "SSH to m68k.club. Classic Mac community with gopher:70 and gemini:1965." \
  "ssh m68k.club"

add_system "bncshells" "Oddities" \
  "BNCShells — commercial UNIX shell & eggdrop provider (nostalgic shell provider)." \
  "Web: https://BNCshells.com. Still selling shell accounts in 2026!" \
  "ssh bncshells.com"

add_system "kermit" "Oddities" \
  "Kermit Server (quux.org) — last public Internet Kermit Service Daemon." \
  "Use: ${BOLD}telnet kermit.quux.org 1649${NC}. Login as 'anonymous'. Possibly the last public IKSD!" \
  "telnet kermit.quux.org 1649"

add_system "cavebbs" "BBS" \
  "Cave BBS / Vintage Computing — Synchronet BBS + CaveMUSH." \
  "Telnet vintagecomputing.com port 23 or 2323. Also runs cavemush.com." \
  "telnet vintagecomputing.com"

add_system "athelstan" "BBS" \
  "Athelstan BBS — Synchronet BBS in Houston, TX. SSH+rlogin+finger." \
  "Telnet athel.synchro.net or athelstan.org. Full retro protocol support." \
  "telnet athel.synchro.net"

add_system "apostols" "BBS" \
  "Apostols BBS — Germany-based BBS." \
  "Telnet bbs.apostols.org port 23." \
  "telnet bbs.apostols.org"

add_system "retrodigital" "BBS" \
  "RetroDigital BBS — QOTD+gopher+finger+rlogin+IRC! Very retro." \
  "Telnet rdnetbbs.com. Has quote of the day on port 17, gopher:70, finger:79." \
  "telnet rdnetbbs.com"

add_system "duensing" "BBS" \
  "Duensing Digital — QOTD+gopher+finger+Synchronet BBS." \
  "Telnet bbs.duensing.digital. Has QOTD:17, gopher:70, finger:79." \
  "telnet bbs.duensing.digital"

# ── Route Servers / Looking Glasses ──
add_system "route-views" "Route Servers" \
  "Route Views (U of Oregon) — classic BGP route collector, public since 90s." \
  "Use: ${BOLD}telnet route-views.routeviews.org${NC}. Shows global BGP routing tables. Legendary." \
  "telnet route-views.routeviews.org"

add_system "att-route" "Route Servers" \
  "AT&T Route Server — explore internet routing." \
  "Use: ${BOLD}telnet route-server.cbbtier3.att.net${NC}." \
  "telnet route-server.cbbtier3.att.net"

add_system "gtt-route" "Route Servers" \
  "GTT Route Server — global transit provider." \
  "Use: ${BOLD}telnet route-server.ip4.gtt.net${NC}." \
  "telnet route-server.ip4.gtt.net"

add_system "is-route" "Route Servers" \
  "public-route-server.is.co.za — South African route server." \
  "Use: ${BOLD}telnet public-route-server.is.co.za${NC}." \
  "telnet public-route-server.is.co.za"

add_system "kanren-lg" "Route Servers" \
  "KANREN Looking Glass — Kansas Research & Education Network." \
  "Use: ${BOLD}telnet rviews.bb.net.kanren.net${NC}." \
  "telnet rviews.bb.net.kanren.net"

# ── Fun quick things ──
add_system "starwars" "Fun" \
  "Star Wars ASCII Episode IV — watch the whole movie in ASCII art via telnet." \
  "Use: ${BOLD}telnet towel.blinkenlights.nl${NC}. Press Ctrl+C to exit." \
  "telnet towel.blinkenlights.nl"

add_system "panix-finger" "Fun" \
  "Finger PANIX uptime — classic finger protocol, check when PANIX was last rebooted." \
  "Finger: ${BOLD}finger -l 0@shell.panix.com${NC}." \
  "finger -l 0@shell.panix.com"

add_system "mit-finger" "Fun" \
  "Finger MIT's SIPB — finger the MIT Student Information Processing Board." \
  "Finger: ${BOLD}finger -l sipb@mit.edu${NC}. Classic MIT finger since the 90s." \
  "finger -l sipb@mit.edu"

add_system "qotd" "Fun" \
  "Quote of the Day — grab a random quote from a QOTD server." \
  "Connects to rdnetbbs.com port 17 (QOTD service)." \
  "bash -c 'exec 3<>/dev/tcp/rdnetbbs.com/17; cat <&3; exec 3<&-'"

add_system "chargen" "Fun" \
  "Chargen — hit a chargen server for old times' sake (port 19)." \
  "Instant Whip Foods runs an old-school chargen service. ASCII characters." \
  "bash -c 'exec 3<>/dev/tcp/74.218.70.5/19; head -c 200 <&3; exec 3<&-'"

add_system "dict-org" "Fun" \
  "dict.org — classic DICT dictionary server (RFC 2229). 166+ databases." \
  "Use: ${BOLD}telnet dict.dict.org 2628${NC}. Has WordNet, Jargon File, FOLDOC, GCIDE, and more. Try 'SHOW DB'." \
  "telnet dict.dict.org 2628"

# ─── System lookup ──────────────────────────────────────────────────────────

get_sys() {
  local name="$1"
  for entry in "${SYSTEMS[@]}"; do
    IFS='|' read -r n c d h cmd <<< "$entry"
    if [[ "$n" == "$name" ]]; then
      echo "$entry"
      return 0
    fi
  done
  # partial match
  for entry in "${SYSTEMS[@]}"; do
    IFS='|' read -r n c d h cmd <<< "$entry"
    if [[ "$n" == *"$name"* ]]; then
      echo "$entry"
      return 0
    fi
  done
  return 1
}

# ─── Functions ──────────────────────────────────────────────────────────────

show_connection() {
  local name category desc hint cmd
  IFS='|' read -r name category desc hint cmd <<< "$1"
  clear
  echo ""
  echo -e "${CYAN}╔════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║  ${BOLD}$name${NC}"
  echo -e "${CYAN}╚════════════════════════════════════════════════╝${NC}"
  echo ""
  echo -e "${YELLOW}Category:${NC} $category"
  echo -e "${YELLOW}Description:${NC}"
  echo -e "  $desc" | fmt -w 70
  echo ""
  echo -e "${GREEN}Hint:${NC}"
  echo -e "  $hint" | fmt -w 70
  echo ""
  echo -e "${BLUE}Command:${NC} $cmd"
  echo ""
  echo -e "${GREEN}[c] Connect  ${YELLOW}[b] Back to menu  ${RED}[q] Quit${NC}"
  echo -n -e "${BOLD}Choose: ${NC}"
  read -r action
  case "$action" in
    c|C|connect|y|yes)
      echo ""
      echo -e "${CYAN}Connecting to ${name}...${NC}"
      echo -e "${YELLOW}Command: ${cmd}${NC}"
      echo -e "${YELLOW}(Press Ctrl+C to disconnect)${NC}"
      echo ""
      sleep 1
      eval "$cmd"
      echo ""
      echo -e "${YELLOW}Disconnected from ${name}.${NC}"
      echo -n -e "${GREEN}Press Enter to continue...${NC}"
      read -r
      ;;
    b|B|menu|back)
      return 0
      ;;
    q|Q|quit|exit)
      echo "Bye!"
      exit 0
      ;;
    *)
      echo -e "${RED}Huh? Try c, b, or q.${NC}"
      sleep 1
      ;;
  esac
}

interactive_menu() {
  local search=""
  while true; do
    clear
    echo ""
    echo -e "${CYAN}┌─────────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}Old-School Internet Systems Explorer${NC}         ${CYAN}│${NC}"
    echo -e "${CYAN}├─────────────────────────────────────────────────┤${NC}"
    if [[ -n "$search" ]]; then
      echo -e "${CYAN}│${NC}  ${YELLOW}Search:${NC} ${search}${NC}                          ${CYAN}│${NC}"
    fi
    echo -e "${CYAN}└─────────────────────────────────────────────────┘${NC}"
    echo ""

    local prev_category=""
    local i=1
    declare -a MENU_NAMES=()
    declare -a MENU_CMDS=()

    for entry in "${SYSTEMS[@]}"; do
      IFS='|' read -r name category desc hint cmd <<< "$entry"

      # Filter by search
      if [[ -n "$search" ]] && \
         ! (echo "$name" | grep -qi "$search" || \
            echo "$category" | grep -qi "$search" || \
            echo "$desc" | grep -qi "$search"); then
        continue
      fi

      if [[ "$category" != "$prev_category" ]]; then
        echo -e "  ${YELLOW}${category}${NC}"
        prev_category="$category"
      fi

      # Short name if long
      printf "  ${GREEN}%2d)${NC} %-18s ${BLUE}%s${NC}\n" "$i" "$name" "$(echo "$desc" | head -c 70)"
      MENU_NAMES+=("$name")
      MENU_CMDS+=("$cmd")
      MENU_NOTES+=("$entry")
      i=$((i + 1))
    done

    echo ""
    echo -e "  ${YELLOW}── Controls ──${NC}"
    echo -e "  ${GREEN}1-${i-1}${NC}  Connect to system"
    echo -e "  ${CYAN}/<text>${NC}  Search (e.g. /bbs)"
    echo -e "  ${CYAN}//${NC}    Clear search"
    echo -e "  ${MAGENTA}r${NC}    Random pick"
    echo -e "  ${RED}q${NC}    Quit"
    echo ""

    if [[ -z "$search" ]]; then
      echo -n -e "${BOLD}Which one? (# or /term or r or q): ${NC}"
    else
      echo -n -e "${BOLD}Pick (#), or /new to re-search, // clear, r random, q quit: ${NC}"
    fi
    read -r choice

    case "$choice" in
      q|Q|quit|exit)
        echo "Bye!"
        exit 0
        ;;
      r|R|random)
        local total=${#MENU_NAMES[@]}
        if (( total > 0 )); then
          local ri=$(( (RANDOM % total) ))
          local chosen_entry="${MENU_NOTES[$ri]}"
          show_connection "$chosen_entry"
        fi
        ;;
      //|"/"|"/ ")
        search=""
        ;;
      /*)
        search="${choice:1}"
        ;;
      "")
        ;;  # just re-draw
      *)
        if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#MENU_NAMES[@]} )); then
          local chosen_entry="${MENU_NOTES[$((choice - 1))]}"
          show_connection "$chosen_entry"
        else
          echo -e "${RED}Invalid: ${choice}${NC}"
          sleep 1
        fi
        ;;
    esac
  done
}

# ─── List (quick reference) ─────────────────────────────────────────────────

list_systems() {
  echo ""
  echo -e "${CYAN}Quick Reference:${NC}"
  echo ""
  local prev_category=""
  for entry in "${SYSTEMS[@]}"; do
    IFS='|' read -r name category desc hint cmd <<< "$entry"
    if [[ "$category" != "$prev_category" ]]; then
      echo -e "${YELLOW}  $category:${NC}"
      prev_category="$category"
    fi
    printf "    ${GREEN}%-20s${NC} %s\n" "$name" "$cmd"
  done
  echo ""
  echo -e "${GREEN}Usage:${NC} ./connect.sh           (interactive menu)"
  echo "       ./connect.sh <name>   (connect directly)"
  echo "       ./connect.sh random   (surprise me)"
  echo ""
}

# ─── Main ──────────────────────────────────────────────────────────────────

case "${1:-}" in
  list|ls|--list)
    list_systems
    ;;
  ""|menu|interactive)
    interactive_menu
    ;;
  random|r)
    local total=${#SYSTEMS[@]}
    local ri=$(( RANDOM % total ))
    local entry="${SYSTEMS[$ri]}"
    IFS='|' read -r name category desc hint cmd <<< "$entry"
    echo -e "${CYAN}Random pick: ${BOLD}${name}${NC} (${category})"
    echo -e "${BLUE}${desc}${NC}"
    echo -e "${GREEN}Connecting...${NC}"
    sleep 1
    eval "$cmd"
    ;;
  *)
    if found=$(get_sys "${1}"); then
      IFS='|' read -r name category desc hint cmd <<< "$found"
      echo -e "${CYAN}${name}${NC} (${category})"
      echo -e "${BLUE}${desc}${NC}"
      echo -e "${YELLOW}Hint: ${hint}${NC}"
      echo ""
      echo -n -e "${GREEN}Connect now? (y/N): ${NC}"
      read -r yn
      if [[ "$yn" == "y" || "$yn" == "Y" ]]; then
        echo ""
        echo -e "${CYAN}Connecting...${NC}"
        sleep 1
        eval "$cmd"
      fi
    else
      echo -e "${RED}Unknown: ${1}${NC}"
      echo "Run: ./connect.sh list"
      exit 1
    fi
    ;;
esac
