<div align="center">

# 🧩 ChatGPT-CodexSkills

**Reusable Codex skills for engineering, software, documentation, and technical workflows**

**ชุดทักษะ Codex ที่นำกลับมาใช้ซ้ำได้ สำหรับงานวิศวกรรม ซอฟต์แวร์ เอกสาร และการแก้ปัญหาเชิงเทคนิค**

[![Codex](https://img.shields.io/badge/Codex-Compatible-111827?style=for-the-badge)](https://developers.openai.com/codex/skills/)
[![Skills](https://img.shields.io/badge/Skills-14-2563EB?style=for-the-badge)](#available-skills)
[![License](https://img.shields.io/badge/License-MIT-22C55E?style=for-the-badge)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-0EA5E9?style=for-the-badge)](#repository-status)

[English](#english) · [ภาษาไทย](#ภาษาไทย) · [Installation](#installation) · [Skills](#available-skills)

</div>

---

<a id="english"></a>

## 🇬🇧 English

### Overview

ChatGPT-CodexSkills is a version-controlled collection of reusable skills distilled from recurring engineering, lab, embedded, software, Linux, automation, documentation, and troubleshooting workflows.

The skills are intentionally written as reusable operating procedures rather than project dumps. Public files exclude credentials, private account information, salary data, customer sample logistics, device serial numbers, and unnecessary internal project identifiers.

### Design principles

- **Evidence before guesses** — inspect logs, measurements, code, wiring, and configuration first.
- **Systematic troubleshooting** — use `Define → Collect Evidence → Isolate → Verify → Prevent`.
- **Baseline discipline** — preserve known-good software versions and test configurations until a new baseline is explicitly approved.
- **Practical engineering** — prefer measurable checks, expected values, selection criteria, and regression verification.
- **Bilingual communication** — support concise Thai/English technical reporting when useful.
- **Safe public reuse** — publish methods and templates, not secrets or sensitive project data.

<a id="available-skills"></a>

### Available skills

| Skill | Purpose |
|---|---|
| [`professional-project-readme`](skills/professional-project-readme/) | Create polished bilingual repository documentation. |
| [`engineering-troubleshooting`](skills/engineering-troubleshooting/) | Systematically isolate faults across software, hardware, wiring, setup, equipment, communication, power, and environment. |
| [`automotive-can-capl`](skills/automotive-can-capl/) | Develop and debug CAN/CANoe/CAPL/DBC workflows, including long-run timing and interface troubleshooting. |
| [`electrical-power-lab`](skills/electrical-power-lab/) | Analyze 3-phase lab power, regenerative equipment, protection coordination, neutral/harmonic issues, and energy use. |
| [`esp32-data-logger-control`](skills/esp32-data-logger-control/) | Build robust ESP32 web loggers/controllers with serial equipment links, SD logging, profiles, and multi-node designs. |
| [`raspberry-pi-linux-troubleshooting`](skills/raspberry-pi-linux-troubleshooting/) | Troubleshoot Raspberry Pi/Linux networking, VNC, Wayland/X11, autologin, headless sessions, and remote access. |
| [`equipment-driver-integration`](skills/equipment-driver-integration/) | Build reusable equipment drivers around SCPI, GPIB, RS232, Modbus, CAN, command parsing, and state handling. |
| [`test-data-plotting-performance`](skills/test-data-plotting-performance/) | Design responsive long-run plotting tools with dual axes, decimation, fading, reports, and bounded memory. |
| [`software-release-maintenance`](skills/software-release-maintenance/) | Inspect repositories, fix code, regression-test, update docs/version history, package releases, and preserve baselines. |
| [`technical-reporting-presentation`](skills/technical-reporting-presentation/) | Turn engineering work into concise impact-focused slides, reports, lessons learned, and team-development material. |
| [`home-assistant-truenas-iot`](skills/home-assistant-truenas-iot/) | Plan and troubleshoot Home Assistant OS on TrueNAS VM environments and integrate mixed IoT ecosystems step by step. |
| [`technical-comparison-selection`](skills/technical-comparison-selection/) | Compare engineering components or technologies using measurable criteria, constraints, compatibility, and practical recommendations. |
| [`engineering-translation-writing`](skills/engineering-translation-writing/) | Translate and polish Thai/English engineering communication without losing technical meaning. |
| [`windows-automation-scripting`](skills/windows-automation-scripting/) | Create small Windows/Python/batch utilities for file processing, scheduled backup, persistent consoles, and repeatable automation. |

### Skill activation model

Each skill has a required `SKILL.md` and an `agents/openai.yaml` metadata file. Skills can be invoked explicitly, for example:

```text
$engineering-troubleshooting Help isolate this intermittent test failure.
```

or selected automatically when the request clearly matches the skill description.

<a id="installation"></a>

### Installation

#### Install one skill with Codex

```text
$skill-installer Install engineering-troubleshooting from https://github.com/TOPTUBBY/ChatGPT-CodexSkills/tree/main/skills/engineering-troubleshooting
```

Replace the final folder name with any skill from the table above.

#### Install all skills manually on Windows

```powershell
git clone https://github.com/TOPTUBBY/ChatGPT-CodexSkills.git
New-Item -ItemType Directory -Force "$HOME\.agents\skills" | Out-Null
Copy-Item -Recurse -Force ".\ChatGPT-CodexSkills\skills\*" "$HOME\.agents\skills\"
```

#### Install all skills manually on macOS/Linux

```bash
git clone https://github.com/TOPTUBBY/ChatGPT-CodexSkills.git
mkdir -p "$HOME/.agents/skills"
cp -R ChatGPT-CodexSkills/skills/* "$HOME/.agents/skills/"
```

### Repository structure

```text
ChatGPT-CodexSkills/
├── LICENSE
├── README.md
└── skills/
    ├── automotive-can-capl/
    ├── electrical-power-lab/
    ├── engineering-translation-writing/
    ├── engineering-troubleshooting/
    ├── equipment-driver-integration/
    ├── esp32-data-logger-control/
    ├── home-assistant-truenas-iot/
    ├── professional-project-readme/
    ├── raspberry-pi-linux-troubleshooting/
    ├── software-release-maintenance/
    ├── technical-comparison-selection/
    ├── technical-reporting-presentation/
    ├── test-data-plotting-performance/
    └── windows-automation-scripting/
```

### Public-safety boundary

This repository is intended for reusable methods. Before publishing updates, remove or generalize credentials, internal URLs, private infrastructure, customer/sample identifiers, serial numbers, personal financial information, and proprietary project data unless publication is explicitly authorized.

---

<a id="ภาษาไทย"></a>

## 🇹🇭 ภาษาไทย

### ภาพรวม

Repository นี้รวบรวม Skill ที่สกัดจากวิธีทำงานจริงและนำกลับมาใช้ซ้ำได้ ครอบคลุมงานวิศวกรรมไฟฟ้า/ยานยนต์, CAN/CAPL, ESP32, Linux/Raspberry Pi, Equipment Interface, Data Plotting, Software Release, Technical Report/Presentation, Home Assistant และงาน Automation บน Windows

แนวทางหลักคือ **ไม่เก็บข้อมูลโปรเจกต์แบบ dump ลง public repository** แต่เปลี่ยนประสบการณ์และความรู้ให้เป็นขั้นตอนแก้ปัญหา วิธีตรวจสอบ และเกณฑ์ตัดสินใจที่ใช้กับโปรเจกต์อื่นได้

### หลักการใช้งาน

- เริ่มจากหลักฐานและค่าที่วัดได้ ไม่เดาสุ่ม
- ใช้ Framework `Define → Collect Evidence → Isolate → Verify → Prevent`
- รักษา baseline/version ที่ใช้งานได้จริงจนกว่าจะอนุมัติ baseline ใหม่
- งานแก้ปัญหาให้เริ่มจาก check ที่เร็วและเสี่ยงต่ำก่อน แล้วค่อยลงลึก
- งานเอกสารให้สั้น ชัด มี Impact และรักษาความหมายทางเทคนิค
- ก่อน push ข้อมูลลง public repo ให้ตัดข้อมูลส่วนตัว ข้อมูลลูกค้า secret และข้อมูลภายในที่ไม่จำเป็นออก

### การติดตั้ง

สามารถติดตั้งเฉพาะ Skill ผ่าน `$skill-installer` หรือ clone repository แล้วคัดลอกทุกโฟลเดอร์ใต้ `skills/` ไปที่ personal skills directory ของ Codex ตามตัวอย่างในหัวข้อ [Installation](#installation)

---

<a id="repository-status"></a>

## 📌 Repository status

- **Visibility:** Public
- **License:** [MIT](LICENSE)
- **Maintainer:** [TOPTUBBY](https://github.com/TOPTUBBY)
- **Current skill count:** 14
- **Knowledge snapshot:** 2026-09-21

Contributions and improvements are welcome through GitHub Issues and pull requests.
