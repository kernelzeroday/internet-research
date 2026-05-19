# HP/UX 10.20 — "hkypux" (HP 9000/715)

> **Museum:** SDF Vintage Systems (UNIX sub-menu, option `f`)  
> **Direct:** `ssh hkypux@bitzone.sdf.org`  
> **Guest login:** `icm` / `ICMguest`  
> **Logout:** `CTRL-D`

---

## Historical Significance

**HP/UX** (Hewlett-Packard UNIX) was HP's version of Unix for their
PA-RISC workstation line. Version 10.20 was released in 1996, at the peak
of the Unix workstation wars. HP was competing against Sun's Solaris,
SGI's IRIX, IBM's AIX, and DEC's Digital UNIX.

The **HP 9000/715** was a mid-range PA-RISC workstation introduced in the
early 1990s. It used HP's proprietary PA-7100 or PA-7150 CPU running at
50-100 MHz, with up to 384 MB of RAM. These machines were common in
engineering, scientific, and financial environments.

HP/UX was known for:
- **SAM** (System Administration Manager) — a menu-driven admin tool
- **Logical Volume Manager** — HP's advanced disk management
- **HP-UX 10.20** was the first version to support 64-bit PA-RISC CPUs
- **CDE** (Common Desktop Environment) — the standard Unix GUI
- Strong NFS and networking performance

By 2007 (when this system's clock stopped), HP/UX was still alive but
HP was already planning the migration to HP/UX 11i and eventually the
Itanium architecture.

---

## Expedition Log

**Date:** 2026-05-19 (system time: **June 27, 2007**)  
**Login:** `icm` / `ICMguest`

### Welcome Banner

```
HP-UX hkypux B.10.20 A 9000/715 (ttyp1)

login: icm
Password:
Please wait...checking for disk quotas

(c)Copyright 1983-1996 Hewlett-Packard Co.,  All Rights Reserved.
(c)Copyright 1979, 1980, 1983, 1985-1993 The Regents of the Univ. of California
(c)Copyright 1980, 1984, 1986 Novell, Inc.
(c)Copyright 1986-1992 Sun Microsystems, Inc.
(c)Copyright 1985, 1986, 1988 Massachusetts Institute of Technology
(c)Copyright 1989-1993  The Open Software Foundation, Inc.
(c)Copyright 1986 Digital Equipment Corp.
(c)Copyright 1990 Motorola, Inc.
(c)Copyright 1990, 1991, 1992 Cornell University
(c)Copyright 1989-1991 The University of Maryland
(c)Copyright 1988 Carnegie Mellon University

RESTRICTED RIGHTS LEGEND
Use, duplication, or disclosure by the U.S. Government is subject to
restrictions as set forth in sub-paragraph (c)(1)(ii) of the Rights in
Technical Data and Computer Software clause in DFARS 252.227-7013.

Hewlett-Packard Company
3000 Hanover Street
Palo Alto, CA 94304 U.S.A.
```

**The copyright banner is a who's-who of Unix history.** HP/UX 10.20
contains code from:
- **HP** (obviously) — the core OS
- **UC Berkeley** — BSD TCP/IP, vi, etc.
- **Novell** — the former owner of Unix System V
- **Sun Microsystems** — NFS
- **MIT** — X Window System
- **OSF** — OSF/Motif, the CDE
- **DEC** — networking code
- **Motorola** — possibly the m88k port
- **Cornell, Maryland, CMU** — academic contributions

This single copyright block tells the story of how Unix fragmented and
reassembled throughout the 1980s and 1990s.

### System Info

```
uname -a
HP-UX hkypux B.10.20 A 9000/715 2010819802 two-user license

date
Wed Jun 27 07:35:39 PDT 2007

who
icm        ttyp1        Jun 27 07:35
```

**Notable:**
- "two-user license" — This is a deliberately limited system, licensed
  for only two simultaneous users. In the 1990s, software was often sold
  per-user.
- The date is **June 27, 2007** — frozen in time like the other simulators.
- The system ID `2010819802` is the HP-UX unique system identifier.

### Quirks and Observations

1. **The two-user license**: HP charged by the seat. This system is limited
   to two concurrent logins, which means only one guest at a time (plus root).

2. **Date in 2007**: While UNIX V7 is stuck in 1997, HP/UX is a decade
   ahead at 2007. This reflects when the simulator images were last set up
   or the decision of which era they represent.

3. **The copyright scroll**: The login process takes noticeably long because
   of the legal banner. This was mandatory for commercial Unix — every login
   had to display the copyright and restricted rights notice.

4. **`/etc/release` doesn't exist**: Unlike modern Linux, this HP/UX
   version doesn't have a release file in /etc. System identity comes from
   `uname -a`.

5. **RISC workstation feel**: The 9000/715 was a real PA-RISC workstation.
   The two-user license and the restricted rights legend place you in a
   corporate engineering context circa 1996.

## Fun Tests to Try

- [ ] `uname -m` — what machine architecture?
- [ ] `model` — HP command for hardware model
- [ ] `cat /etc/hosts` — network configuration
- [ ] `swlist` — list installed software
- [ ] `sam` — System Administration Manager (if menu-driven)
- [ ] `what /usr/lib/libc.a` — check object versions
- [ ] `adb /hp-ux` — examine the kernel
- [ ] `lsdev` — list devices
- [ ] `ioscan -f` — I/O system scan
- [ ] `ps -ef` — full process list
