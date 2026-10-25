# Slot Machines — MTA:SA

A collection of animated slot machine games and a placeable "game machine" system for **Multi Theft Auto: San Andreas (MTA:SA)**.

**Developer:** Sc00By

---

## Overview

This package contains several themed 5‑reel slot machines plus the shared resources needed to place and manage them in‑world. Players insert credits at a physical machine, spin, win on paylines, trigger free‑play bonuses, and gamble their winnings.

## Resources

| Resource | Type | Description |
|----------|------|-------------|
| `gamemachines` | core | Spawns, saves and manages the physical slot machine objects. Handles credits, deposits/withdrawals and the admin placement system. Persists machines in MySQL. |
| `controls` | shared lib | Control/zoom/font helper used by the slot games. |
| `goldrush` | game | Gold Rush themed slot. |
| `gtaslot` | game | GTA themed slot. |
| `westernslot` | game | Western themed slot. |
| `swslot` | game | Themed slot. |

Each game resource ships with its own fonts, images and sounds under `files/`.

## Requirements

- MTA:SA server **1.5.7** or newer.
- A MySQL / MariaDB database.
- A server framework that exposes money functions. These scripts use OwlGaming‑style exports such as `exports.global:getMoney`, `exports.global:takeMoney` and `exports.global:giveMoney`, and an admin check for placing machines.

## Installation

### 1. Create the database table

Run the following in phpMyAdmin (SQL tab):

```sql
CREATE TABLE `gamemachines` (
  `dbId` int(11) NOT NULL,
  `gameType` enum('GOLD_RUSH','GTA','WESTERN','STAR_WARS') NOT NULL DEFAULT 'GOLD_RUSH',
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `rotZ` float NOT NULL DEFAULT 0,
  `interior` int(3) NOT NULL DEFAULT 0,
  `dimension` int(5) NOT NULL DEFAULT 0,
  `credit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

ALTER TABLE `gamemachines`
  MODIFY `dbId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `gamemachines`
  ADD PRIMARY KEY (`dbId`);
```

### 2. Adapt to your framework (non‑OwlGaming servers)

- Edit the MySQL connection in `gamemachines/sourceS.lua` (around line 56).
- Replace all money globals (e.g. `exports.global:getMoney`, `takeMoney`, `giveMoney`) with the equivalents your server uses to get/take/give player money.
- Replace the admin check used by the machine placement/creation system.

### 3. Deploy

Drop all resource folders into your server's `resources` directory and start them (start `controls` and `gamemachines` before the game resources).

## License / Credits

Developed by **Sc00By**. Provided as‑is, without warranty.
