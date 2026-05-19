# SDF Public Access UNIX System — Account & Exploration

## Account

- **Username:** u4225287
- **Password:** demo141133168
- **Host:** sdf.org (ssh)
- **Type:** Free USERS account (prevalidated)
- **Expires:** 365 days from creation (May 2027)
- **Home:** /sdf/udd/u/u4225287

## How We Registered

The registration flow was automated with `probes/register-sdf.exp`:

1. `ssh new@sdf.org` — SDF changed from `newuser` to `new`
2. Press RETURN to trigger mkacct connection
3. Login: `new` / Password: `new` (on the mkacct server)
4. Press BACKSPACE key (terminal detection)
5. Press RETURN through intro text
6. Enter desired login name (alpha-numeric only!)
7. Read and accept policy (type "yes")
8. Answer personal questions (name, birth year, zip, student/ham/DJ/Minecraft, referral)
9. Confirm account creation
10. Set password (truncated to 8 chars by crypt algorithm)
11. Account created!

## System

- **OS:** NetBSD 9.3/amd64 (GENERIC kernel, August 2022)
- **Shell:** Custom "psh" (SDF Shell v8)
- **Servers:** 22 hosts (faeroes, iceland, mx, norge, otaku, sverige, etc.)
- **Users:** ~4300 concurrent at peak
- **Disk:** 457G local (6% used) + 49T NFS (/sdf, 18% used)
- **Hosting:** Seattle WA, Dallas TX, Germany

## Available Unix Commands (Prevalidated)

cd, pwd, ls, cat, mkdir, rm, mv, chmod, edit, ps, passwd

## Games

### Classic
- advent (Colossal Cave, 350pt)
- rogue, hack, nethack
- zork, zork2, zork3 (Infocom interactive fiction)

### Multiplayer
- dopewars — multi-user virtual urban life
- hunt — multi-user maze/shoot
- mazewar — System V classic
- tetrinet — 6-player tetris
- war — turn-based strategy

### Unique to SDF
- aybabtu — ALL YOUR BASE ARE BELONG TO US
- barnacle — Hunt the Wumpus
- dinkum — Adventure in Australia
- greed — how far will your greed take you?
- invaders — Space Invaders
- knight — Knight's Tour matrix
- life — SDF life simulator
- linux — Linux massacre simulator
- mdg — MultiUser Dungeon Game
- moon — moon-buggy
- mud — SDF MultiUser Dungeon
- oneliner — SDF oneliners since 1987
- sokoban — box puzzle
- suicide — animated suicide trio
- tess — beyond the tesseract
- torus — faster robots
- tttt — wraparound tic-tac-toe
- wanderer — strategic puzzle/adventure
- zombies — zombie horde

### Classic NetBSD Games
- adventure, backgammon, battlestar, boggle, canfield, chess, cribbage, fish, fortune, hack, hangman, mille, monop, morse, phantasia, pig, pom, ppt, primes, quiz, rain, robots, rogue, sail, snake, tetris, trek, worm, wumpus

### SDF Classic Server (3b2.sdf.org)
- c4, othello, lander, rainbow, ski

## Custom SDF Commands (in /usr/local/bin)

| Category | Commands |
|----------|----------|
| **Chat** | com, commode, ecom, pcom, comwho, ecomwho, pcomwho |
| **Social** | guestbook, bboard, happening, sdfers, vote, rmvote, contest |
| **Info** | help, helpdesk, how, what, faq, unix, software, commands |
| **Web** | lynx, webmail, mkgopher, mkgopherspace, mkhomepg, mkgallery |
| **Mail** | mail, expunge, delete, delme, confirm |
| **Games** | playgames, dopewars, mazewar, zork, thxmoo, mud, mdg |
| **Fun** | cbonsai, ching, ddate, decdate, fortune, jargon, yow, rainbow, xmas, dick |
| **Network** | ssh, telnet, traceroute, ping, udns, vpn, vpnstats |
| **Dev** | gcc, gmake, cmake, fpc, perl, python(?), lisp, php, sqlite3 |
| **System** | passwd, chsh, chfn, mkfinger, quota, uptime, w, delete, rmuser |
| **Retro** | plan9, twenex, tx0, unix, vintage |
| **Services** | deskshots, dialup, dsl, voip, voiprates, donate, dues |

## Infrastructure

- **NFS mount:** mx1:/sdf on /sdf (49TB)
- **User homes:** /sdf/udd/{first-letter}/{username}
- **Custom shell:** /usr/local/bin/psh
- **Packages:** /usr/pkg/bin (NetBSD pkgsrc)
- **Web:** http://u4225287.sdf.org (once set up)
- **Email:** u4225287@sdf.org
- **IRC:** irc.sdf.org
- **Matrix:** matrix.sdf.org
- **Mastodon:** mastodon.sdf.org

## Membership Tiers

| Tier | Cost | Features |
|------|------|----------|
| USERS | Free (validate $1-3) | 200MB, shell, email, web, IRC, games |
| ARPA | $36 lifetime | 600MB, compilers, outbound SSH, CGI, voting |
| MetaARPA | $36/yr | 1GB, SSL, cron, screen, tunnels, git, NextCloud |

## To Validate

Type `validate` to pay $1-3 for full weekend IRC access and increased limits.
Type `arpa` for lifetime membership ($36).
