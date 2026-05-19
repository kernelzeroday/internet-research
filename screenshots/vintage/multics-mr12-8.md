# Multics MR12.8 — Honeywell 6180 (Living Computers: Museum + Labs)

> **Museum:** SDF Vintage Systems (main menu, option `a`, then `b` for museum)  
> **Login:** `login Tourist` (the word "login" is part of the username)  
> **Password:** `tourist`  
> **Logout:** `logout`

---

## Historical Significance ★★★★★

**Multics** (Multiplexed Information and Computing Service) was the most
ambitious operating system ever conceived when it began at MIT's Project MAC
in 1964. Developed by MIT, Bell Labs, and General Electric (later Honeywell),
Multics pioneered virtually every concept we take for granted in modern
operating systems:

- **Hierarchical file system** — with access control lists (ACLs)
- **Dynamic linking** — shared libraries loaded at runtime
- **Ring-oriented security** — the first multi-level security model
- **Online reconfiguration** — add/remove hardware without rebooting
- **Reliable computation** — 99.9% uptime was a design goal
- **Single-level store** — virtual memory that treated files and memory
  as the same thing

Ken Thompson and Dennis Ritchie worked on Multics before creating Unix.
Thompson famously said Unix was "a stripped-down Multics" — the name Unix
is a pun on "Eunuchs" (a castrated Multics). Dennis Ritchie described Unix
as what you get when you take Multics and "shrink it to fit on a PDP-7."

This instance is **Multics MR12.8**, the final release version from 1988,
running on a Honeywell 6180 mainframe — the "DPS/M" (datacenter) or
"L68" (museum) configuration. It's hosted at the LCM+L (Living Computers:
Museum + Labs) and accessible through the SDF gateway.

---

## Expedition Log

**Date:** 2026-05-19 (system time matches: **05/18/26 18:49 pst Mon**!)  
**Login:** `login Tourist` / password `tourist`

### The HSLA Port Connection

Multics uses a **HSLA (High-Speed Line Adapter)** port selector — a remnant
of the mainframe era where physical terminals connected through port
concentrators. The prompt:

```
HSLA Port (d.h001,d.h002,...,d.h029)?
```

Entering nothing defaults to `d.h001`. The system then attaches to the line
and connects:

```
Attached to line d.h001
```

### The Welcome Screen

```
Multics MR12.8: Living Computers: Museum + Labs (Channel d.h001)

Load = 5.0 out of 90.0 units: users = 5, 05/18/26  1849.9 pst Mon
```

**Unique Multics features visible immediately:**
- **Load measured in "units out of 90.0"** — Multics measured CPU load on a
  scale of 0 to 90.0 units, not as a percentage. 90.0 = fully loaded.
- **Date format**: `05/18/26 1849.9` — uses the standard US date format
  but with decimalized minutes (1849.9 = 6:49.9 PM).
- **Time zone**: `pst Mon` — Pacific Time (the system is in Seattle WA).
- **5 users online** — 5 people were logged into Multics simultaneously
  on a Monday evening in 2026, decades after the system was supposed to
  be extinct.

### The Login Process

Multics login requires the literal command `login Tourist` — not just typing
the username:

```
login Tourist
Password:
```

This is because Multics's command processor (`shell`) interprets everything as
a command. `login` is a command that takes a username argument.

### Successful Login

After login:
```
No mail.
r 18:50 0.696 96
```

The status line shows: time 18:50, a load/running value, and "96"
(some status indicator).

### The Multics Prompt

The Multics shell prompt is **`>`** — not `$` or `%`. This is a Multics
trademark, carried forward from the earliest versions.

### Commands

**`help`** — The help system works:
```
Multics provides online help through information segments (info segs)
such as this one.  Type the command "help TOPIC" where TOPIC is a
```

The help system uses "info segments" — the root of the modern Emacs
Info system and the `man` page concept.

**`date`** — enters the `doc>` subsystem
**`who`** — enters the `info>` subsystem

(Our probe disconnected before we could get full output from these
commands.)

### Quirks and Observations

1. **The date is correct!** Unlike the other simulators that are frozen in
   1997 or 2007, this Multics system reports the actual current date and
   time. This is because it's running on a real simulated mainframe that's
   properly maintained.

2. **Load in "units"**: Multics doesn't use Unix's load average. Instead it
   measures load on a 0-90.0 scale. 5.0 out of 90.0 = very lightly loaded,
   but the scale is different enough to be confusing.

3. **Decimal time**: `1849.9` instead of `18:49`. Multics used decimal
   minutes (hundredths of an hour) in its date display.

4. **The HSLA port** is mainframe technology from a time when terminals
   connected through physical port switches. The user had to know which
   port they wanted.

5. **5 users logged in** on the museum instance on a Monday evening — the
   system still has a small but active user base.

6. **No mail.** The Tourist account has no new mail, which is expected
   for a guest account.

7. The command `login Tourist` syntax is unique to Multics — you don't
   just type your username, you type `login <username>` as a command.

---

## Fun Tests to Try

- [ ] `help TOPIC` — explore the info segment system
- [ ] `help` alone — list all help topics
- [ ] `who` — who else is on the system
- [ ] `date` — show date in Multics format
- [ ] `logout` — log out (how polite!)
- [ ] `print` — Multics print command
- [ ] `list` — directory listing (Multics uses `list` not `ls`)
- [ ] `list >user_dir` — list home directory
- [ ] Try the DPS/M datacenter build instead of museum
