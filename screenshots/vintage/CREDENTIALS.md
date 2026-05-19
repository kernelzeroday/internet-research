# SDF Vintage Systems — Guest Credentials Reference

Each vintage system uses different guest logins. This cheat sheet
documents what works for each.

## Main Menu Systems

| Letter | System | Login | Password | Notes |
|--------|--------|-------|----------|-------|
| a | **Multics** | `Tourist` | `tourist` | Sub-menu: a=datacenter, b=museum first |
| b | TOPS-20 (TOAD-2) | — | — | |
| c | TWENEX (TOPS-20) | — | — | |
| d | TOPS-20 MARS (SC40) | — | — | |
| e | TOPS-10 MARS (SC40) | — | — | |
| f | **ITS** (PDP-10 KS10) | — | — | ITS famously has no passwords |
| g | TOPS-10 KA1050 | — | — | |
| h | TOPS-10 KL2065 | — | — | |
| i | **OpenVMS** (VAX 4000-60) | `LCM` | `lcmguest` | ✓ Confirmed working |
| j | TSS/8 (PDP-8/e) | — | — | |
| k | VM/SP5 (IBM 4361) | — | — | |
| l | **CTSS** (IBM 7094) | — | — | First time-sharing OS! |
| m | NOS 1.3 (CDC-6500) | — | — | |
| n | CP-V (XDS Sigma 9) | — | — | |

## UNIX Sub-Menu Systems

| Letter | System | Login | Password | Notes |
|--------|--------|-------|----------|-------|
| a | **UNIX V7** (PDP-11/70) | `lcm` | (none?) | ✓ Credentials seen on info screen |
| b | BSD/386 v1.1 | — | — | |
| c | UNIX SVR3.2.3 (AT&T 3B2) | — | — | |
| d | BSD 4.3 (MicroVAX 3900) | — | — | |
| e | BSD 2.11 (PDP-11/84) | `lcm` | — | Probably same pattern |
| f | **HP/UX 10.20** (HP9000/715) | `icm` | `ICMguest` | ✓ Confirmed on info screen |
| g | TRU64 5.0 (DEC Alpha) | — | — | |
| h | SunOS 4.1.1 (Sun-3/160) | — | — | |
| i | **IRIX 6.5** (SGI Indy) | `icm` | `ICMguest` | Probably same as HP/UX |
| j | Ultrix 2.0 (MicroVAX I) | — | — | |
| k | m-net FreeBSD 14.2 | — | — | Modern system |
| l | DG/UX R4.11 (m88k) | — | — | |
| m | Ultrix 4.5 (DECstation) | — | — | |
| n | Solaris 2.6 (SS20) | — | — | |
| z | UNIX50 (Various) | — | — | |

## Direct SSH Access

Some systems can also be reached directly:

| System | Direct Access |
|--------|---------------|
| OpenVMS (Rosencrantz) | `ssh rosie@bitzone.sdf.org` |
| HP/UX | `ssh hkypux@bitzone.sdf.org` |
| SDF Menu | `ssh menu@sdf.org` |
| SDF Shell (prevalidated) | `ssh u4225287@sdf.org` / pass `demo141133168` |
| UNIX50 | `ssh unix50@unix50.org` |

## General Patterns

- Most systems use the password `lcmguest` or `ICMguest`
- The Interim Computer Museum (ICM) uses `icm`/`ICMguest` pattern
- The LCM+L systems use `lcm`/`lcmguest` or `LCM`/`lcmguest`
- Logout commands vary: `LOGOUT`, `logout`, or `CTRL-D`

## Probe Scripts

Use `probes/probe-vintage.exp <letter> [submenu]`:

```shell
# OpenVMS already confirmed working:
expect probes/probe-vintage.exp i main /tmp/vms.txt

# Try UNIX V7 with correct login:
expect probes/probe-vintage.exp a unix /tmp/v7.txt

# Try HP/UX with correct login:
expect probes/probe-vintage.exp f unix /tmp/hpux.txt
```
