# OpenVMS 7.3 — "Rosencrantz" (VAXstation 4000-60)

> **Museum:** SDF Vintage Systems (main menu, option `i`)  
> **Direct:** `ssh rosie@bitzone.sdf.org`  
> **Guest login:** `LCM` / `lcmguest`  
> **Logout:** `LOGOUT`  
> **Return to menu:** `CTRL-]`

---

## Historical Significance

**VMS (Virtual Memory System)** was DEC's 32-bit flagship operating system,
introduced alongside the VAX-11/780 minicomputer in 1977. It was DEC's answer
to the question: "What if we built an operating system that was reliable above
all else?" The result was a system that could run for years without crashing,
with cluster support, journaled filesystems, and a security model that earned
it the B1 security rating — the first commercially available OS to achieve that.

VMS had a fundamentally different philosophy from Unix. Where Unix was concise
to the point of obscurity, VMS was verbose and self-documenting. The DCL
(DIGITAL Command Language) shell used commands like `SHOW SYSTEM`, `DIRECTORY`,
and `PRINT` — complete words that told you what they did. File versioning was
built into the filesystem: create a file three times and you get `FILE.TXT;1`,
`FILE.TXT;2`, and `FILE.TXT;3`.

**Rosencrantz** is a real VAXstation 4000-60 running OpenVMS 7.3, hosted at the
Interim Computer Museum. The hostname pairs with **Guildenstern**, the BSD 4.3
system elsewhere in this collection — a Shakespeare reference (Rosencrantz and
Guildenstern from Hamlet, later immortalized by Tom Stoppard).

---

## Expedition Log

**Date:** 2026-05-19  
**Login:** LCM / lcmguest (guest account)

### Connection

SSH to `menu@sdf.org`, selected system `i` (OpenVMS 7.3). The menu displays:

```
* login 'LCM', password 'lcmguest'
* logout by typing 'LOGOUT'
* You can use 'ssh rosie@bitzone.sdf.org' to connect directly
```

The connection was proxied through the SDF network (`172.16.36.12`).

### Welcome Banner

```
Welcome to the Interim Computer Museum! You have reached our VAXstation 
4000-60, named Rosencrantz. If you have an account, please log in. New
accounts can be requested by Interim Computer Museum Bootstrap members.

Username: LCM
Password:

    Welcome to Rosencrantz!
         (VAXstation 4000-60 @ Interim Computer Museum)

Happy New Year 03752! What will you hack today?

    Last interactive login on Tuesday, 19-MAY-2026 02:38
    Last non-interactive login on Sunday, 28-SEP-2025 21:40

%SET-W-NOTSET, error modifying TNA2963:
-SET-I-UNKTERM, unknown terminal type

Command FORUM for system wide bulletin board
```

**Observations:**
- "Happy New Year 03752!" — VMS uses its own calendar convention. 03752 is
  the year in the DEC "Modified Julian Date" convention, or a custom epoch.
- The `%SET-W-NOTSET` error is from the terminal type detection failing over
  SSH — this is a common issue with vintage systems accessed through modern
  terminal emulators.
- The MOTD mentions a "FORUM" for a system-wide bulletin board.

### The DCL Shell Prompt

The VMS DCL prompt is simply `$`. Unlike Unix shells that use `$` as a standard
user prompt, VMS places the prompt on its own line and expects commands in a
specific format.

#### COMMANDS RUN

**`HELP`** — VMS DCL help system is extensive. The response showed available
topics spanning the entire DCL command set. Notable entries include:

```
ACCOUNTING   ACL_Editor   ACS   ADA   ALLOCATE   ANALYZE   APPEND
ASSIGN   ATTACH   AUTHORIZE   AUTOGEN   BACKUP   BASIC   BLISS
CALL   CANCEL   CC   CLOSE   CMS   COBOL   CONFIGURE   CONNECT
CONTINUE   CONVERT   COPY   CREATE   DEBUG   DECK   DEFINE   DELETE
DEPOSIT   DIRECTORY   DISABLE   DISCONNECT   DISMOUNT   DUMP
EDIT   ENABLE   EXAMINE   EXCHANGE   EXIT   FINGER   FORTRAN
FTP   HELP   IF   INITIALIZE   INQUIRE   INSTALL   JAVA   LIBRARY
LICENSE   LINK   LISP   LOGIN   LOGOUT   LPQ   LPRM   MAIL   MERGE
MONITOR   MOUNT   NCP   PASCAL   PASSWORD   PHONE   PIPE   PRINT
PRODUCT   PURGE   QUEUES   RCP   READ   RECALL   RECOVER   RENAME
REPLY   RMS   RSH   RUN   RUNOFF   SEARCH   SET   SHOW   SORT
SPAWN   START   STOP   SUBMIT   SYNCHRONIZE   TALK   TELNET   TYPE
UNLOCK   VIEW   WAIT   WRITE
```

Additional help libraries: `THIS_SYSTEM`, `GAMES`, `MGBOOK`, `NEW_USER`

**`HELP DATE`** — "Sorry, no documentation on DATE" — which is amusing since
DATE should be a `SHOW TIME` command in VMS.

### Quirks and Observations

1. **Terminal type error**: The first thing VMS does on login is try to
   negotiate the terminal type. Over SSH, this produces `%SET-W-NOTSET,
   error modifying TNA2963: -SET-I-UNKTERM, unknown terminal type`. This is
   a classic example of protocol mismatch between vintage and modern systems.

2. **Case sensitivity**: VMS commands are case-insensitive (unlike Unix).
   `help`, `HELP`, and `Help` all work the same way.

3. **Verbose by default**: VMS DCL commands are English-like. `SHOW SYSTEM`
   instead of `ps`, `DIRECTORY` instead of `ls`, `PRINT` instead of `lpr`.

4. **File versioning**: Every file in VMS has a version number appended after
   a semicolon. `README.TXT;42` means version 42 of README.TXT. When you
   edit a file, VMS creates a new version rather than overwriting.

5. **The "Happy New Year" message**: The year 03752 is worth investigating.
   VMS stores dates as a delta from the DEC epoch (November 17, 1858, the
   start of Modified Julian Dates). 03752 would be... something interesting.

### What We Missed

We didn't get far enough to run `SHOW SYSTEM`, `DIRECTORY`, or check on file
versioning, but the system is alive and open for further exploration.

---

## Fun Test Ideas

- [ ] `SHOW TIME` — what date/time format does VMS use?
- [ ] `SHOW SYSTEM` — process list in VMS style
- [ ] `DIRECTORY [...]` — recursive directory listing
- [ ] `CREATE HELLO.FOR` then `FORTRAN HELLO` then `RUN HELLO` — FORTRAN on VMS
- [ ] Create a file, modify it, check version numbers
- [ ] `HELP GAMES` — what games are available?
- [ ] `MAIL` — is there local mail?
- [ ] `PHONE` — VMS's built-in chat system
- [ ] `FINGER` — finger protocol on VMS
