# Cool Old-School Systems on the Internet

A curated catalog of public-access Unix systems, tilde clubs, BBSes, MUDs, and
other interesting interactive services found on the public internet via Shodan.

## Quick Start

```
./connect.sh              # interactive menu with search & details
./connect.sh sdf          # quick-connect to SDF (auto-login with newuser)
./connect.sh telehack     # quick-connect to Telehack
./connect.sh random       # surprise me
./connect.sh list         # list all available systems
```

## Legend

| Icon | Meaning |
|------|---------|
| T    | Telnet (:23) |
| S    | SSH (:22) |
| G    | Gopher (:70) |
| F    | Finger (:79) |
| R    | Rlogin (:513) |
| B    | BBS software running |
| Gmi  | Gemini (:1965) |
| IRC  | IRC server |

---

## Public Access Unix Systems (Pubnixes)

These systems offer (or historically offered) shell accounts to the public.
The true old-school spirit of time-sharing Unix.

### SDF Public Access UNIX System
```
Host:       sdf.org (205.166.94.16)
Access:     S  G  F  HTTP
Services:   SSH (OpenSSH 10.2), Gopher, Finger, FTP, HTTP
OS:         NetBSD
Org:        Troubador Systems, Seattle, WA
Register:   ssh -l newuser sdf.org
Login:      ssh sdf.org
```
The original ARPA-style public access Unix system. Free shell accounts at
`ssh -l newuser sdf.org` (use the username **newuser** to register).
After registration, just `ssh sdf.org` with your new username.
Has been running since the 1980s. Offers email, gopher, finger, games,
and a massive collection of classic software. MetaArray the parent org
also runs the sister nodes below.

**Sister nodes:** norge.sdf.org, iceland.sdf.org, otaku.sdf.org,
faeroes.sdf.org, sverige.sdf.org, rie.sdf.org, miku.sdf.org

### Freeshell.org
```
Host:       freeshell.org (205.166.94.30)
Access:     S  G  F  HTTP
Services:   SSH, Gopher, FTP
OS:         NetBSD
Org:        Troubador Systems, Seattle, WA
```
"SDF Public Access UNIX System - Free Shell Account and Shell Access".
Same org as SDF.

### PANIX (Public Access UNIX)
```
Host:       shell.panix.com (166.84.1.10)
Access:     S  F  R  HTTP
Services:   SSH (OpenSSH 9.6), Finger, Rlogin, FTP, Rsync, Daytime
OS:         NetBSD
Org:        Panix, New York City
```
One of the oldest public access Unix systems in the world, founded in 1989.
Still running today. shell-3.panix.com runs NetBSD. Also has a web-based
terminal at https://shell.panix.com. Try `ssh shell.panix.com` (guest?).

**Other PANIX hosts:** panix1-ssh.panix.com, panix2.panix.com,
shell-1.panix.com, shell-2.panix.com, panix5.panix.com, panix6.panix.com

---

## Tilde Clubs

Modern communities built around the old-school shared Unix ethos, usually
named with a tilde prefix.

### Tilde.Club
```
Host:       tilde.club (144.217.139.196 / ssh.tilde.club)
Access:     S  G  F  Gmi  IRC  Email
Services:   SSH (:22, :2222, :443), Gopher, Finger, Email (SMTP/POP/IMAP),
            Gemini, IRC (:6697), NNTP
OS:         Ubuntu
Org:        OVH, Montreal, Canada
```
The original tilde club. A community of users sharing a Unix system.
Offers shell accounts, web hosting (~user), email, irc, gemini, gopher.

### Tilde.Team / Tildeverse
```
Host:       tilde.team (198.50.210.250 / tildeverse.org)
Access:     S  G  F  Gmi  IRC  Email
Services:   SSH (:22, :2222), Gopher, Finger, Email, IRC (:6697), Gemini
OS:         Ubuntu
Org:        OVH, Montreal, Canada
```
A tilde community with full services. Sister site: bsd.tilde.team.

### Tilde.Town
```
Host:       tilde.town (23.133.40.12)
Access:     S  G  F  Gmi
Services:   SSH (OpenSSH 10.0), Gopher, Finger, Gemini, QOTD
Org:        Colocataires Inc., Ottawa, Canada
```
A creative tilde community with a focus on art and writing.

### Tilde.Institute
```
Host:       tilde.institute (159.69.146.152)
Access:     S  G  F  Email
Services:   SSH (OpenSSH 9.3), Gopher, Finger, Email
Org:        Hetzner, Nuremberg, Germany
```

### Thunix
```
Host:       thunix.net (142.44.150.185)
Access:     S  G  F  Gmi  Email
Services:   SSH (:22, :2222, OpenSSH 10.0), Gopher, Finger, Email,
            Gemini (:1965)
Org:        OVH, Montreal, Canada
```
A pubnix / tilde community with full services.

### Vern.cc
```
Host:       vern.cc (5.161.108.85)
Access:     S  T  G  F  R  IRC  Email  Rsync  Dict
Services:   SSH (:22, :2222), Telnet (:23), Gopher, Finger, Rlogin,
            Rsync, Dict (:2628), Email, IRC (:6697), Gemini (:1965),
            Icecast streaming (:8533)
Org:        Hetzner, Ashburn, VA
```
A very full-featured pubnix with an impressive number of old-school
protocols. Has rlogin, a dict server, and even an Icecast streaming
media server. A gem.

### Envs.net
```
Host:       envs.net (2a01:4f9:3100:3b2b::2)
Access:     G
Services:   Gopher
Org:        Hetzner
```
A pubnix with gopher presence.

---

## Vintage / ARPANET Simulation

### Telehack
```
Host:       telehack.com (64.13.139.230)
Access:     T  R  F  G  HTTP
Services:   Telnet (:23), Rlogin (:513), Finger (:79), Gopher (:70),
            FTP (:21), QOTD (:17), plus ports 1337, 2222, 6668, 31337
Org:        Silicon Valley Colocation, San Jose, CA
```
A simulation of the early ARPANET / 1980s computing culture. When you
telnet in, you're dropped into a simulated historical Unix environment
with classic commands, games (adventure, star trek, etc.), BBS-style
message boards, and more. `telehack.com` or just `telnet telehack.com`.

---

## BBS Systems

### Synchronet Software (Official & Flagship)
```
Host:       synchro.net (71.95.196.36)
Access:     T  S  R  G  F  B
Services:   Synchronet BBS, Telnet, SSH, Rlogin, Gopher, Finger,
            FTP, HTTP
Org:        Charter Communications, Riverside, CA
```
Home of the Synchronet BBS software. Runs everything.

### Vertrauen BBS
```
Host:       vert.synchro.net (71.95.196.34)
Access:     T  S  R  F  B
Services:   Synchronet BBS (v3.22), Telnet, SSH, Rlogin, Finger,
            Email
```
Flagship Synchronet BBS run by the software's developer. One of the
most well-known telnet BBSes still running.

### DataStream BBS
```
Host:       dsbbs.net (192.99.119.89)
Access:     T  S  R  B
Services:   Synchronet BBS (v3.20), Telnet, SSH, Rlogin, FTP, Email
Org:        OVH, Montreal, Canada
```

### Amiga City
```
Host:       amigacity.xyz (96.126.98.54)
Access:     T  S  R  G  F  B  IRC
Services:   Synchronet BBS, Telnet, SSH, Rlogin, Gopher, Finger, IRC,
            Email, FTP
Org:        Linode, Fremont, CA
```
An Amiga-themed BBS with full retro protocol support. Amiga-focused
community.

### Classic Macs BBS / Retro OS
```
Host:       macos.retro-os.live (192.81.129.7)
Access:     T  S  R  G  F  VNC  IRC
Services:   Synchronet BBS, Telnet, SSH, Rlogin, Gopher, Finger, VNC,
            IRC, Email
OS:         AOS
Org:        Linode, Fremont, CA
```
A classic Mac OS themed BBS. Has a VNC server and runs a retro Mac
environment. OS identified as "AOS" by Shodan.

### C3BBS Retro Networking
```
Host:       c3bbs.retronetworking.org (213.95.46.21)
Access:     T  S  R  G  F  B
Services:   BBS, Telnet, SSH, Rlogin, Gopher, Finger, FTP, Email, NNTP, IRC
Org:        noris network, Germany
```
A retro networking BBS in Germany. Full suite of old protocols
including NNTP and rlogin.

### WarpStream
```
Host:       warpstream.org (45.79.37.227)
Access:     T  S  R  G  F  B  IRC
Services:   BBS, Telnet, SSH, Rlogin, Gopher, Finger, IRC
Org:        Linode, Richardson, TX
```

### End of the Line BBS
```
Host:       bbs.endofthelinebbs.com (192.138.210.158)
Access:     T  B
Services:   BBS via Telnet, FTP
Org:        Zappie Host
```

### More Synchronet BBSes (all accessible via telnet on port 23):
- kingdomsend.synchronetbbs.org (45.79.111.157)
- seaoffantasy.synchronetbbs.org (45.56.82.207)
- weednet.synchronetbbs.org (45.79.69.172)
- deadinternet.synchronetbbs.org (139.177.199.122)
- paradoxbbs.synchronetbbs.org (172.105.94.5)
- ohb.synchronetbbs.org (45.79.210.198)
- bbs.lsnet.dev (51.81.98.250)
- bbs.telephreak.org (167.99.232.54) — also has finger!
- bbs.dragonsweb.org (192.250.226.6)
- bbs.tul.cz (147.230.18.111) — LIANE BBS, run on old Apache 1.3.12
- fido.bajtek.org (31.133.0.38) — Fidonet BBS!
- falconbbs.nl (87.251.38.7) — Falcon BBS / Fidonet node (Netherlands)
- ftelnet.synchro.net (170.75.163.46) — fTelnet BBS (Synchronet v3.20)
- enigma-bbs.com (54.37.51.222)
- magnumbbs.net (51.75.174.224)
- darkagesbbs.com (192.187.108.99)
- bbs.fleethq.org (192.203.175.220)

---

## Games

### Free Internet Chess Server (FICS)
```
Host:       freechess.org (54.39.129.129)
Access:     T  S
Services:   Telnet (:23), SSH (:22), Web
Org:        OVH, Montreal, Canada
```
The original free chess server. telnet freechess.org or
ssh freechess.org. Play chess against humans and computers.

### NetHack 4
```
Host:       nethack4.org (92.243.9.88)
Access:     T  S
Services:   Telnet (:23), SSH (:22)
Org:        GANDI, Paris, France
```
The classic dungeon-crawling roguelike playable in your terminal.
telnet nethack4.org or ssh nethack4.org.

### RIT Games (CSH)
```
Host:       games-ng.csh.rit.edu (129.21.49.195)
Access:     T
Services:   Telnet (:23)
Org:        Rochester Institute of Technology
```
A nethack server hosted by RIT's Computer Science House.

### Miklagard NetHack
```
Host:       miklagard.net (198.98.57.241)
Access:     T
Services:   Telnet (:23), HTTP
Org:        FranTech Solutions, New York City
```
NetHack server and more at server1.miklagard.net.

### Nanvaent MUD
```
Host:       lost.nanvaent.org (207.162.200.121)
Access:     T  S
Services:   Telnet (:23), SSH (:22), Web
Org:        The Flirble Organisation, Absecon, NJ
```
A MUD (Multi-User Dungeon) — a text-based virtual world. One of the few
still running on telnet.

---

## Communities

### Timeheart
```
Host:       connect.timeheart.net (74.93.13.195)
Access:     T  S
Services:   Telnet (:23), SSH (:22, :2222)
Org:        Comcast, Monterey, CA
```
A community system with both telnet and SSH access.

---

## Network Infrastructure (Public Route Servers)

These are publicly accessible telnet services for exploring internet
routing. Old-school network operators used these to debug connectivity.
Still accessible today.

### Route Views (University of Oregon)
```
Host:       route-views.routeviews.org (128.223.51.103)
Access:     T
Services:   Telnet (:23)
Org:        University of Oregon, Eugene, OR
```
The legendary Internet route collector. Shows global BGP routing tables.

### AT&T Route Server
```
Host:       route-server.cbbtier3.att.net (12.0.1.28)
Access:     T
Services:   Telnet (:23)
```

### GTT Route Server
```
Host:       route-server.ip4.gtt.net (213.200.87.251)
Access:     T
Services:   Telnet (:23)
```

### Other Route Servers / Looking Glasses:
- public-route-server.is.co.za (196.4.160.227) — South Africa
- rviews.bb.net.kanren.net (164.113.193.221) — Kansas Research
- openserve-south-route-viewer.osnet.co.za — Telkom SA
- openserve-north-route-viewer.osnet.co.za — Telkom SA
- openserve-east-route-viewer.osnet.co.za — Telkom SA
- lg.sp.ptt.br — São Paulo Internet Exchange
- lg.pr.ptt.br — Paraná Internet Exchange
- lg.sc.ptt.br — Santa Catarina Internet Exchange
- lg.mg.ptt.br — Minas Gerais Internet Exchange
- lg.ba.ptt.br — Bahia Internet Exchange
- route-server.bsn05.twdx.net — TowardEX
- ntp.altaria.net / lg.altaria.net — Everex, Spain
- route-server.dokom.net — Dokom, Germany
- Various Seacom looking glasses — across UK, France, Kenya, South
  Africa, Tanzania, Mozambique, Uganda, Netherlands
- lg.digicable.hu — DIGI, Hungary

---

## Old Protocol Servers (Finger, Gopher, QOTD)

### Notable Finger Servers
- mit.edu (18.x.x.x) — MIT's finger servers at christmas-tree.mit.edu,
  sipb-noc.mit.edu, directory.mit.edu (classic)
- panix.com — Finger service on all PANIX shells

### Gopher Holes of Note
- Almost all tilde clubs run gopher (:70)
- hackerheaven.org (95.179.183.33)
- unixlore.ca (nix2.unixlore.ca, nix3.unixlore.ca)

---

## Fun / One-offs

### Star Wars ASCII (towel.blinkenlights.nl)
```
Host:       towel.blinkenlights.nl
Access:     T
Services:   Telnet (:23)
```
Telnet in and watch Star Wars Episode IV rendered entirely in ASCII art.
A beloved internet classic. Just `telnet towel.blinkenlights.nl`.

### Finger PANIX
Check when PANIX rebooted last using the finger protocol:
`finger -l 0@shell.panix.com`

### Finger MIT
Finger the MIT SIPB:
`finger -l sipb@mit.edu`

---

## How to Contribute

Found something cool that's not on this list? Add it! Or just telnet/SSH
in and enjoy. Most of these systems welcome new users.

## Disclaimer

Some of these are private systems that happen to be on the internet.
Be respectful — don't brute-force, don't abuse, and follow any
displayed rules. When in doubt, just lurk first.
