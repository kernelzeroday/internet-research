# UNIX V7 — "Miss Piggy" (PDP-11/70)

> **Museum:** SDF Vintage Systems (UNIX sub-menu, option `a`)  
> **Guest login:** `lcm` (no password)  
> **Logout:** `CTRL-D` then `CTRL-] quit`

---

## Historical Significance

**UNIX Version 7** (V7), released by Bell Labs in 1979, was the last true
"research" Unix and arguably the most influential operating system ever
written. V7 gathered up everything learned from the previous six versions
and shipped a complete, polished, portable time-sharing system that would
define the standard for the next forty years.

What V7 introduced or standardized:
- **The Bourne shell** (`sh`) — the progenitor of all Unix shells
- **The V7 file system layout** — `/bin`, `/usr`, `/etc`, `/dev`, `/tmp`
- **The C compiler** (`cc`) — Dennis Ritchie's C was the system language
- **`make`** — Stuart Feldman's build automation tool
- **`adb`** — the debugger
- **`grep`, `awk`, `sed`, `find`, `sort`, `tar`** — the Unix toolkit
- **Standard I/O library** (`stdio`) — portable I/O

V7 ran on the PDP-11/70, DEC's most successful minicomputer. The 11/70 had
a 16-bit CPU with up to 4 MB of memory, 2 MB of which was addressable at
once — laughable by modern standards, but a powerhouse in 1979.

**Miss Piggy** is a PDP-11/70 simulator, described in the MOTD as "a former
Microsoft decdatasystem-570" — a DEC datasystem rebadged by Microsoft in
their pre-MS-DOS era when they sold DEC hardware.

---

## Expedition Log

**Date:** 2026-05-19 (system time: **December 23, 1997**)  
**Login:** `lcm` (guest, no password)

### Welcome Banner

```
Connected to the PDP-11 simulator DCI device, line 2

login: lcm

Welcome to MissPiggy running 7th Edition UNIX!

You are on a former Microsoft decdatasystem-570 (aka PDP-11/70)
For a list of games, type 'games'.
To sign the guestbook, type 'guestbook'.

You have mail.
```

**The date is broken.** The system reports `Tue Dec 23 14:30:03 EST 1997`.
This is a frozen simulator — the clock stopped when the simulator was last
started. This means:
- MOTD features that depend on the date are broken (e.g., fortunes)
- The "Quote of the Day" error: `Can't open /usr/lib/fortunes`
- File timestamps reflect 1997

### Shell Environment

The V7 Bourne shell prompt is simply `$`. The PATH includes custom additions:
`uuencode`, `uudecode`, and `s` (a screen editor described as "kind of like vi").

The MOTD includes a note from the administrator:
- `vi` is installed
- MicroEMACS 3.6 is available as `ue` (arrow keys don't work, but Emacs
  commands `C-b`, `C-f`, `C-p`, `C-n` do)
- `s` commands are documented at the referenced GitHub repository

### Filesystem

The guest home directory (`/home/lcm` or equivalent) is a fascinating
archaeological layer cake of previous visitors' experiments:

```
.guestbook    .guestbook.bak  .old         .profile
.sentry       .vi             a.out        bin
boo           crc32.c         cstand       cstand.c
data          dsize16kr       dsize16kr.c  ed.hup
edTest        endian          ensaio.bas   etc
example.c     example.sh      fastyes.c    fib
fib.c         fizzbuzz        ginkeo.c     hello
hello.c       hello.tar       hello_from_ahm  hello_guests
helloagain.c  helloworld      helloworld.bas  helloworld.c
hw            input.txt       korpela      lib
makefile      matrix          matrix.c     memory
myhello       n.bas           pi           pi.c
pi.f          pi2             pi2.c        ports
primes        primes.c        qwe          shless
siva          slime.c         slime_src    speedtest.org
src           src-fib         struct       struct.c
temp          test            test.c       tmp
try           try.c           unroll_src   yes
zzhied.c
```

This directory is a **time capsule of guest activity**. Every person who
connected left their mark — hello worlds in C, BASIC, and Fortran; pi
calculators; FizzBuzz; CRC32; matrix multiplication; prime number sieves.

### Who Is Online

```
who
lcm      tty01   Dec 23 14:26
lcm      tty02   Dec 23 14:30
```

Two guest sessions — the system treats each SSH connection as a separate
login.

### Quirks and Observations

1. **The frozen clock**: The system hasn't experienced time since 1997.
   This is a common behavior for PDP-11 simulators — without NTP or a
   battery-backed clock, the simulation starts at whatever time the
   simulator image records.

2. **Microsoft PDP-11**: The MOTD says this is a "former Microsoft
   decdatasystem-570." Microsoft sold DEC hardware in the late 1970s and
   early 1980s before entering the OS business. The PDP-11 running UNIX
   V7 at Microsoft is a strange image.

3. **`s` editor**: An editor specifically described as "kind of like vi"
   that predates the familiar vim. It has commands documented in C source.

4. **Broken fortunes**: `Can't open /usr/lib/fortunes` — the classic Unix
   fortunes database isn't installed or the path is wrong. This may be
   because the simulator was set up as a minimal image.

5. **"You have mail"**: V7's mail system is active. No `/bin/mail` output
   was attempted, but the flag is set.

6. **The `games` command**: V7 came with a set of PDP-11 games including
   adventure, chess, and backgammon.

## Fun Tests to Try

- [ ] `games` — what games are available?
- [ ] `advent` — Colossal Cave on V7
- [ ] `mail` — read the system mail
- [ ] `cat /etc/passwd` — see the user database
- [ ] `cat /usr/include/sys/param.h` — V7 kernel constants
- [ ] `cc hello.c && ./a.out` — compile with V7's C compiler
- [ ] `make` — build from an existing Makefile
- [ ] `man ls` — V7 manual pages (troff format)
- [ ] `ls -l /bin` — see the minimal V7 command set
- [ ] `ps` — V7 process list
