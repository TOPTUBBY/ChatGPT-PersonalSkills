<div align="center">

# 🧩 ChatGPT-CodexSkills

**Reusable Codex skills for consistent, professional project workflows**

**ชุดทักษะ Codex ที่นำกลับมาใช้ซ้ำได้ เพื่อให้งานแต่ละโปรเจกต์มีคุณภาพและรูปแบบสม่ำเสมอ**

[![Codex](https://img.shields.io/badge/Codex-Compatible-111827?style=for-the-badge)](https://developers.openai.com/codex/skills/)
[![Skills](https://img.shields.io/badge/Skills-1-2563EB?style=for-the-badge)](#available-skills)
[![License](https://img.shields.io/badge/License-MIT-22C55E?style=for-the-badge)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-0EA5E9?style=for-the-badge)](#repository-status)

[English](#english) · [ภาษาไทย](#ภาษาไทย) · [Installation](#installation) · [Skills](#available-skills)

</div>

---

<a id="english"></a>

## 🇬🇧 English

### Overview

ChatGPT-CodexSkills is a public collection of reusable skills for ChatGPT and Codex. Each skill packages focused instructions and supporting resources so recurring workflows can be performed consistently across projects and computers.

The repository currently includes a professional README authoring skill based on the documentation style developed for the DataPEA and ADTD projects.

### Why this repository exists

- 📚 Keep reusable workflows in one version-controlled location.
- 🔁 Apply the same quality standard across future projects.
- 💻 Make personal skills easy to install on another computer.
- 🤝 Share improvements through normal Git collaboration.
- 🔒 Publish instructions and templates without project secrets or internal data.

<a id="available-skills"></a>

### Available skills

| Skill | Purpose | Main contents |
|---|---|---|
| [`professional-project-readme`](skills/professional-project-readme/) | Creates or substantially redesigns professional repository README files in a bilingual DataPEA/ADTD-inspired format. | `SKILL.md`, Codex UI metadata, and a reusable README template |

### How Codex skills work

A skill is a directory containing a required `SKILL.md` file and optional resources such as templates, references, scripts, or UI metadata. Codex can activate a skill explicitly from a prompt or implicitly when a request matches the skill description.

See the [official OpenAI guide to building skills](https://developers.openai.com/codex/skills/) for the current specification and supported locations.

<a id="installation"></a>

### Installation

#### Option 1 — Ask Codex to install it

Invoke `$skill-installer` and ask it to install `professional-project-readme` from this repository:

```text
$skill-installer Install professional-project-readme from https://github.com/TOPTUBBY/ChatGPT-CodexSkills/tree/main/skills/professional-project-readme
```

#### Option 2 — Install manually on Windows

```powershell
git clone https://github.com/TOPTUBBY/ChatGPT-CodexSkills.git
New-Item -ItemType Directory -Force "$HOME\.agents\skills" | Out-Null
Copy-Item -Recurse -Force ".\ChatGPT-CodexSkills\skills\professional-project-readme" "$HOME\.agents\skills\"
```

#### Option 3 — Install manually on macOS or Linux

```bash
git clone https://github.com/TOPTUBBY/ChatGPT-CodexSkills.git
mkdir -p "$HOME/.agents/skills"
cp -R "ChatGPT-CodexSkills/skills/professional-project-readme" "$HOME/.agents/skills/"
```

Codex detects skill changes automatically. Restart Codex if the newly installed skill does not appear.

### Usage

Explicitly invoke the skill in Codex:

```text
$professional-project-readme Create a professional bilingual README for this repository.
```

You can also make a normal README request. Codex may select the skill automatically when the request matches its description.

### Repository structure

```text
ChatGPT-CodexSkills/
├── LICENSE
├── README.md
└── skills/
    └── professional-project-readme/
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        └── assets/
            └── README.template.md
```

### Updating an installed skill

Pull the latest repository changes, then copy the skill directory to your personal skills directory again. Review changes before updating workflows used in important repositories.

### Troubleshooting

| Problem | Suggested action |
|---|---|
| Skill does not appear | Confirm that `SKILL.md` is directly inside the skill folder, then restart Codex. |
| Skill is not selected automatically | Invoke it explicitly with `$professional-project-readme`. |
| An older version is still used | Replace the installed folder with the latest repository copy and restart Codex. |
| README output contains assumptions | Provide the repository files or facts needed by the skill; it is designed not to invent unverified details. |

---

<a id="ภาษาไทย"></a>

## 🇹🇭 ภาษาไทย

### ภาพรวม

ChatGPT-CodexSkills คือคลังสาธารณะสำหรับเก็บทักษะที่นำกลับมาใช้ซ้ำได้ใน ChatGPT และ Codex แต่ละทักษะประกอบด้วยคำสั่งเฉพาะทางและทรัพยากรสนับสนุน เพื่อให้งานที่ทำซ้ำในหลายโปรเจกต์มีคุณภาพและรูปแบบสม่ำเสมอ

ปัจจุบัน repository นี้มีทักษะสำหรับจัดทำ README แบบมืออาชีพ โดยประยุกต์รูปแบบเอกสารจากโปรเจกต์ DataPEA และ ADTD

### จุดประสงค์

- 📚 รวมขั้นตอนการทำงานที่ใช้ซ้ำไว้ในระบบควบคุมเวอร์ชัน
- 🔁 ใช้มาตรฐานงานเดียวกันกับโปรเจกต์ในอนาคต
- 💻 ติดตั้ง personal skill บนคอมพิวเตอร์เครื่องอื่นได้ง่าย
- 🤝 เปิดให้พัฒนาและตรวจสอบการเปลี่ยนแปลงผ่าน Git
- 🔒 เผยแพร่เฉพาะคำสั่งและแม่แบบ โดยไม่รวมข้อมูลลับหรือข้อมูลภายในของโปรเจกต์

### ทักษะที่มีในปัจจุบัน

| ทักษะ | ใช้สำหรับ | ไฟล์สำคัญ |
|---|---|---|
| [`professional-project-readme`](skills/professional-project-readme/) | สร้างหรือปรับโครงสร้าง README ของ repository ให้ดูเป็นมืออาชีพ มีภาษาอังกฤษและภาษาไทย และใช้แนวทางแบบ DataPEA/ADTD | `SKILL.md`, ข้อมูลสำหรับหน้า Codex และแม่แบบ README |

### วิธีติดตั้ง

วิธีที่ง่ายที่สุดคือเรียก `$skill-installer` ใน Codex แล้วสั่งให้ติดตั้ง `professional-project-readme` จาก repository นี้ ตามตัวอย่างในหัวข้อ [Installation](#installation)

Codex จะตรวจพบทักษะใหม่โดยอัตโนมัติ หากยังไม่แสดงในรายการ ให้ปิดและเปิด Codex ใหม่อีกครั้ง

### วิธีใช้งาน

เรียกทักษะโดยตรงในข้อความที่ส่งให้ Codex:

```text
$professional-project-readme ช่วยสร้าง README ภาษาไทยและภาษาอังกฤษแบบมืออาชีพสำหรับโปรเจกต์นี้
```

นอกจากนี้ยังสามารถขอให้ Codex สร้างหรือปรับปรุง README ตามปกติได้ หากรายละเอียดงานตรงกับคำอธิบายของทักษะ Codex อาจเลือกใช้ทักษะนี้ให้อัตโนมัติ

### การอัปเดต

ดาวน์โหลดการเปลี่ยนแปลงล่าสุดจาก repository แล้วคัดลอกโฟลเดอร์ทักษะไปยัง personal skills directory อีกครั้ง ควรตรวจสอบการเปลี่ยนแปลงก่อนนำเวอร์ชันใหม่ไปใช้กับ repository สำคัญ

### การแก้ปัญหาเบื้องต้น

| ปัญหา | วิธีตรวจสอบ |
|---|---|
| ไม่พบทักษะใน Codex | ตรวจสอบว่า `SKILL.md` อยู่ภายในโฟลเดอร์ทักษะโดยตรง แล้วเปิด Codex ใหม่ |
| Codex ไม่เลือกทักษะให้อัตโนมัติ | เรียกใช้โดยตรงด้วย `$professional-project-readme` |
| Codex ยังใช้ทักษะเวอร์ชันเดิม | คัดลอกโฟลเดอร์เวอร์ชันล่าสุดทับของเดิม แล้วเปิด Codex ใหม่ |
| README มีข้อมูลที่ยังไม่ยืนยัน | ส่งไฟล์หรือข้อมูลจริงของ repository ให้ครบ เนื่องจากทักษะนี้ถูกออกแบบไม่ให้สร้างข้อเท็จจริงขึ้นเอง |

---

<a id="repository-status"></a>

## 📌 Repository status

- **Visibility:** Public
- **License:** [MIT](LICENSE)
- **Maintainer:** [TOPTUBBY](https://github.com/TOPTUBBY)
- **Current skill count:** 1

Contributions, issue reports, and improvements are welcome through GitHub Issues and pull requests.
