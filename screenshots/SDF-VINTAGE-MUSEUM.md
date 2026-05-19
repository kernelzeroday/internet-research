# SDF Vintage Systems Museum — A Guided Tour

> Access: `ssh menu@sdf.org`  
> SDF's living museum of historical computing systems.  
> These are real, running instances of operating systems from the 1960s through the 1990s.

---

## Overview

The SDF Vintage Systems Museum is one of the most important collections of living
computing history on the internet. Unlike a physical museum where artifacts sit
under glass, every system here is **running and accessible** via SSH. You can
log into Multics, the system that inspired Unix. You can touch the keys of
TOPS-20, which shaped modern command-line interfaces. You can walk through the
entire genealogy of Unix from V7 (1979) through SVR3.2, BSD 4.3, SunOS, IRIX,
HP/UX, Tru64, and Solaris.

This document is our expedition log. Each entry covers:
- **Historical significance** — why this system mattered
- **Connection notes** — how we reached it
- **First impressions** — what surprised, amused, or baffled us
- **Quirks and oddities** — the unintuitive behaviors
- **Commands run** — what we actually did on the system

---

## Main Menu — Non-UNIX Systems

These are the non-Unix operating systems — the roads not taken, or the
foundations on which Unix was built.

---

### [a] Multics MR12.8 — Honeywell 6180

**Historical Significance: ★★★★★**

Multics (Multiplexed Information and Computing Service) was the most ambitious
operating system of the 1960s. Started at MIT's Project MAC in 1964, it pioneered
virtually everything we take for granted today: hierarchical file systems,
dynamic linking, ring-oriented security, multi-level memory management, and
online reconfiguration. Ken Thompson worked on Multics before writing Unix,
famously saying Unix was "a stripped-down Multics."

This is the last known running instance of Multics MR12.8, the final release
(1988), on a Honeywell 6180 mainframe simulator. The real hardware ran at
MIT, Honeywell, and the US Air Force until the early 1990s.

**What to try:**
- The `help` system is famously verbose
- `echo` behaves differently than Unix
- The command processor uses `)` as a prompt

---

### [b] TOPS-20 7(110131)-1 — XKL TOAD-2

**Historical Significance: ★★★★★**

TOPS-20 was DEC's flagship operating system for the PDP-10 mainframe, released
in 1976. It was legendary for its powerful command-line interface, which
introduced features like command completion, file versioning, and a rich
programmability that Unix wouldn't match for years. The XKL TOAD-2 is a
modern (well, 1990s) reimplementation of the PDP-10 in ECL logic.

TOPS-20 had a famously helpful command parser. If you typed something wrong,
it would tell you what it expected. If you typed `?` at any prompt, it would
list all valid completions. This was revolutionary in 1976.

**What to try:**
- Type `?` at the command prompt
- Try `DIRECTORY` (not `ls`)
- Type garbage and see how it responds

---

### [c] TWENEX — TOPS-20 7(63327)-6 on XKL TOAD-2

**Historical Significance: ★★★★★**

"Twenex" was the hacker nickname for TOPS-20. The ITS hackers at MIT called
it "Twenex" as a form of affectionate mockery. This is a different version
of TOPS-20, slightly older build (63327 vs 110131). Both run on XKL TOAD-2
hardware.

The TWENEX era was the heyday of ARPANET hacking — this is the OS that ran
on the PDP-10s at MIT, Stanford, and BBN that were the first nodes on the
ARPANET.

---

### [d] SC40 — TOPS-20 MARS 7(21733)

TOPS-20 running on the SC Group SC40, a modern PDP-10 clone implemented in
FPGA. MARS is a maintenance release of TOPS-20.

---

### [e] SC40 — TOPS-10 MARS 7.05

**Historical Significance: ★★★★☆**

TOPS-10 was DEC's original operating system for the PDP-10, first released in
1967. It was the workhorse of university computing centers throughout the 1970s.
TOPS-20 was derived from TOPS-10 (the TENEX operating system was an MIT
modification of TOPS-10 that eventually became TOPS-20).

TOPS-10 uses a **different command set** from TOPS-20. The most famous command
was `R` (RUN), and file specifications used a completely different syntax.

---

### [f] ITS (Incompatible Timesharing System) — PDP-10 KS10

**Historical Significance: ★★★★★**

ITS was the operating system of MIT's Artificial Intelligence Lab, running on
PDP-6 and PDP-10 computers from 1967 through 1990. It was the home of the MIT
"hacker" culture — the original hacker ethic was forged in the ITS environment.

ITS was deliberately "incompatible" with other systems. It had no passwords
by default, no file permissions, and a famously chaotic user interface. The
first versions of EMACS were written here. The term "hacker" as a compliment
comes from this community.

This instance is ITS version 1652 on a KS10 PDP-10.

---

### [g] KA1050 — TOPS-10 6.03a (simulated)

TOPS-10 version 6.03a, simulated on a KA10 processor (the original PDP-10
model from 1966). This is the earliest version of TOPS-10 in the collection.

---

### [h] KL2065 — TOPS-10 7.04 (simulated)

TOPS-10 version 7.04 on a KL10 processor simulator. The KL10 was the high-end
PDP-10 model introduced in 1975. This is a late version of TOPS-10, close to
when DEC was phasing out the PDP-10 line.

---

### [i] Rosenkrantz — OpenVMS 7.3 on VAX 4000-96

**Historical Significance: ★★★★★**

VMS (Virtual Memory System) was DEC's 32-bit operating system, first released
in 1977 alongside the VAX-11/780 minicomputer. It was one of the most technically
advanced operating systems of its era, with features like symmetric multiprocessing,
clustered systems, and a file system with record management.

OpenVMS 7.3 is a late release, from 2001, when DEC had already been acquired
by Compaq (who would soon be acquired by HP). The VAX 4000-96 is real iron —
a real VAX minicomputer, not a simulator.

The user name "Rosenkrantz" is a Hamlet reference (Rosencrantz, paired with
Guildenstern from the BSD 4.3 system).

**Notable:** VMS had a completely different approach to files and records than
Unix. Filenames include version numbers separated by semicolons (e.g.,
`README.TXT;42`). The command language DCL (DIGITAL Command Language) is
famously verbose.

---

### [j] TSS/8 — PDP-8/e

**Historical Significance: ★★★☆☆**

TSS/8 (Timesharing System for the PDP-8) was a time-sharing system for DEC's
small PDP-8 computer. The PDP-8 was the first successful minicomputer, and
TSS/8 was an attempt to give multiple users interactive access to a machine
that originally cost just $18,000.

The PDP-8/e is a specific model. The `/e` in the model number means it used
the OMNIBUS backplane. This is an actual PDP-8/e running TSS/8.

---

### [k] IBM 4361 — VM/SP5

**Historical Significance: ★★★★☆**

VM (Virtual Machine) was IBM's pioneering hypervisor operating system, first
released in 1972. It was the first system to fully virtualize a mainframe,
creating the concept of virtual machines that we use today in VMware, KVM,
and Hyper-V.

VM/SP5 (System Product Release 5) runs on a Hercules 4361 simulator. The
Hercules emulator is itself a historic piece of software — it emulates IBM
mainframes.

---

### [l] IBM 7094 — CTSS

**Historical Significance: ★★★★★★★**

CTSS (Compatible Time-Sharing System) was the **first time-sharing system in
the world**, developed at MIT's Computation Center in 1961. It ran on an IBM
7090/7094 mainframe. CTSS is where the idea of multiple users simultaneously
interacting with a computer through terminals was proven viable.

This is arguably the most historically significant system in the museum. CTSS
directly led to Multics, which led to Unix, which led to everything we use
today. The IBM 7094 that ran CTSS was the machine that inspired the entire
interactive computing paradigm.

The simulator runs at a fraction of the original 7094's speed — the original
could do about 500,000 instructions per second, while a modern phone does
billions.

---

### [m] CDC 6500 — NOS 1.3

**Historical Significance: ★★★★☆**

CDC (Control Data Corporation) was Seymour Cray's first company. The CDC 6500
was part of the CDC 6000 series, one of the first supercomputer lines. NOS
(Network Operating System) was the native OS for these machines.

CDC systems were used extensively in scientific computing and had a unique
architecture: they used a peripheral processor (PP) architecture where separate
smaller processors handled I/O, freeing the main CPU for computation.

---

### [n] Sigma 9 — Honeywell CP-V

**Historical Significance: ★★★☆☆**

The XDS Sigma 9 was a mainframe from Xerox Data Systems (later sold to Honeywell).
CP-V was Honeywell's multi-user operating system for this platform. This is a
lesser-known but still important branch of computing history — Xerox's attempt
to enter the mainframe market.

---

### [z] Bitzone — NetBSD BBS

**Significance: ★☆☆☆☆**

A modern NetBSD system running a BBS. Included in the museum for completeness
but not historically significant. Still, it runs the same OS as SDF itself.

---

## UNIX Systems Sub-Menu

The genealogy of Unix, from 1979 to the dawn of the modern era.

---

### [a] Miss Piggy — UNIX V7 on PDP-11/70

**Historical Significance: ★★★★★★**

UNIX V7 (Version 7) was the last release of "research" UNIX, distributed by
Bell Labs in 1979. It was the version that took over the world. V7 was the
first to include the Bourne shell, the standard C compiler, and the `adb`
debugger. It ran on the PDP-11/70, DEC's most popular minicomputer.

V7's influence cannot be overstated: virtually every modern Unix command-line
interface is a direct descendant of V7. The file system layout (/bin, /usr,
/etc, /dev) dates from V7. The `grep`, `awk`, `make`, and `sed` commands all
arrived in V7.

The hostname "Miss Piggy" continues the Muppets theme (Kermit, Miss Piggy,
Gonzo, etc.) that SDF uses.

---

### [b] BSD/386 v1.1 — CompuServe Host

**Historical Significance: ★★★★☆**

BSD/386 (later BSD/OS) was the first commercial BSD operating system, released
by Berkeley Software Design Inc. (BSDi) in 1993. This was a landmark because
it was the first version of BSD that could be legally used by commercial
entities without an AT&T license.

This particular instance runs on a "CompuServe Host" — the same hardware
that used to provide CompuServe's dial-up services.

---

### [c] LCM 3B2 — UNIX SVR3.2.3 on AT&T 3B2/1000-70

**Historical Significance: ★★★★☆**

System V Release 3.2 was AT&T's commercial Unix of the late 1980s. The AT&T
3B2/1000-70 was the "super-server" of its day — a 32-bit minicomputer with
up to 16 MB of RAM and 640 MB of disk. This is real hardware from the LCM+L
(Living Computer Museum + Labs).

---

### [d] Guildenstern — BSD 4.3 on simh MicroVAX 3900

**Historical Significance: ★★★★☆**

BSD 4.3 was the 1986 release from UC Berkeley, one of the most important
versions of BSD. It introduced TCP/IP networking as a standard feature,
which was critical to the growth of the internet. The TCP/IP stack in 4.3BSD
was the reference implementation that all others were measured against.

"Guildenstern" pairs with "Rosenkrantz" from the VMS system.

---

### [e] Snake — BSD 2.11 on PDP-11/84

**Historical Significance: ★★★☆☆**

2.11 BSD was a late release (1979) of the original Berkeley Software
Distribution, before the major 4.x series. It ran on PDP-11 hardware and
was used primarily in academic settings.

---

### [f] HP/UX 10.20 on HP9000/715

**Historical Significance: ★★★★☆**

HP/UX was Hewlett-Packard's version of Unix for their HP9000 workstations.
Version 10.20 was released around 1996. The HP9000/715 was a PA-RISC
workstation that was common in engineering and scientific environments.

HP/UX was known for its excellent performance on HP's proprietary PA-RISC
hardware, and for having some quirks — like using a different format for
shared libraries and having unique system administration tools.

**What to try:**
- The `SAM` (System Administration Manager) interface
- Check `uname -a` for the PA-RISC architecture
- See what HP's version of `lp` looks like

---

### [g] Truly — TRU64 5.0 on DEC Alpha 200/166

**Historical Significance: ★★★★☆**

Tru64 UNIX (originally called Digital UNIX, then DEC OSF/1) was DEC's
64-bit Unix for the Alpha processor. The Alpha 200/166 was an entry-level
Alpha workstation running at 166 MHz — fast for its 1995 release.

Tru64 was known for its advanced features: the first production 64-bit
Unix, the AdvFS (Advanced File System) with file system journaling years
before ext3, and clustering support (TruCluster) that allowed up to 8
machines to appear as a single system.

The hostname "Truly" may be a reference to the Alpha's "truly 64-bit" marketing.

---

### [h] Three — SunOS 4.1.1 on Sun-3/160

**Historical Significance: ★★★☆☆**

SunOS 4.1.1 was Sun Microsystems' operating system from 1990, based on
BSD 4.3. The Sun-3/160 was a Motorola 68020-based workstation, the
predecessor to Sun's SPARC-based systems.

---

### [i] Indy — IRIX 6.5 on SGI Indy R5000

**Historical Significance: ★★★★★**

IRIX was Silicon Graphics' Unix for their MIPS-based workstations. IRIX 6.5
(1998) was the mature peak of the OS. The SGI Indy was a "personal workstation"
aimed at the multimedia market, with built-in video and audio capabilities,
and the distinctive purple color scheme.

IRIX was the platform for most 3D rendering and visual effects in the 1990s.
Movies like Jurassic Park (1993) and Toy Story (1995) were created on SGI
workstations running IRIX. The Indy was famous for its "IndyCam" — a built-in
video camera.

---

### [j] HippoVAX — Ultrix 2.0 on DEC MicroVAX I

**Historical Significance: ★★★☆☆**

Ultrix was DEC's version of Unix for their VAX machines, released in the
1980s before DEC decided to go with OSF/1. Ultrix 2.0 is an early version.

---

### [k] M-NET — FreeBSD 14.2

**Historical Significance: ★★☆☆☆**

A modern FreeBSD system. Included in the museum for accessing the network,
not for historical value.

---

### [l] Nostromo — DG/UX R4.11 on AViiON m88k

**Historical Significance: ★★★★☆**

DG/UX was Data General's Unix for their AViiON line of computers, which
used Motorola's 88000 (m88k) RISC processor. This was one of the first 32-bit
RISC implementations of Unix.

Data General was a minicomputer company whose story was told in the book
"The Soul of a New Machine" (the Eclipse MV series). The AViiON line was
their later RISC workstation/server line.

---

### [m] Ultrix 4.5 on DECstation 5000/240

**Historical Significance: ★★★☆☆**

A later version of Ultrix (1990) running on a DECstation, which used the
MIPS R3000 processor instead of DEC's own VAX architecture.

---

### [n] Sparcy — Solaris 2.6 on TMS SuperSparc SS20

**Historical Significance: ★★★★☆**

Solaris 2.6 (1997) was Sun's Unix for their SPARC workstations. This version
was the first to include "WebNFS" and the `pg` command. The SPARCstation 20
was a high-end desktop workstation with up to 4 processors.

SunOS/Solaris was the dominant Unix workstation platform through the 1990s.
Many internet infrastructure technologies were first developed on Solaris.

---

### [z] UNIX50 — Various Versions on Various simh

**Historical Significance: ★★★★★**

UNIX50 is a collection of historical Unix versions running on the simh
PDP-11 emulator. This likely includes versions from V5 through V7, giving
a complete tour of Unix evolution.

This system is also accessible directly at `ssh unix50@unix50.org`.

---

## How to Connect

```shell
ssh menu@sdf.org
```

Then select a system by pressing its letter key:
- `a` through `n` for the main menu
- `1` for the UNIX sub-menu, then `a` through `n` there
- `z` for bonus systems
- `q` to quit
- `CTRL-]` to return to the SDF menu from a connected system

---

## Expedition Notes

Logged by: u4225287@sdf.org  
Date: 2026-05-19  
SDF was host to 4322 concurrent users across 21 servers during our exploration.

---

*To be continued as we visit each system...*
