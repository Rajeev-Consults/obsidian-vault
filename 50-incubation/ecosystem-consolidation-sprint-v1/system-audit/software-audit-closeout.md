---
type: audit-closeout
program: Ecosystem V1
audit_date: 2026-10-06
review_due: 2027-04-06
status: closed-with-follow-ups
tags:
  - ecosystem-v1
  - software-audit
  - operations
---

# Ecosystem V1 — Software Audit Closeout

## Purpose and operating context

This audit prepared the laptop and mobile workflow for the Ecosystem V1 launch. As of this audit, the applications had not yet been used commercially. **ObsidianVault** is the populated control center. **Active-Projects** is intentionally empty while the project workflow awaits definition and real-time inputs.

Hardware reference: Windows 11, Ryzen 3 3250U (2 cores / 4 threads), 5.94 GB usable RAM. RAM and CPU are the practical limits; storage is comparatively comfortable.

## Decisions and evidence

| Item | Decision | Evidence / status |
|---|---|---|
| 1. Python | Retain Python 3.12.10 as the standard installation. | User verified `python --version` = 3.12.10; pip 26.1.2 belongs to Python 3.12; `py -0p` lists 3.12 as default and Astral/CPython 3.11.15 under uv. Python 3.13.15 was removed through Control Panel; a later Installed apps screenshot no longer showed it. Keep 3.11.15 pending later review of its uv-managed purpose. |
| 2. Startup | Keep heavy or optional tools on-demand. | Loom and OneDrive startup were off in the supplied Startup screenshots. User turned Ollama startup off. OneDrive was subsequently launched manually to download files for backup. |
| 3. Workload profiles | Use separate profiles; avoid running several heavy workloads together. | Knowledge/consulting, development, offline AI, AI-assisted work, and media profiles were defined. Estimates are qualitative, not live measurements. |
| 4. App disposition | Keep the tools that support the planned capability map; do not add Trello/ClickUp without a real need. | Paws for Trello was absent from Installed apps. User removed Clipchamp and Xbox. Keep Edge and Copilot. Archi, Cursor, draw.io, and Excalidraw are deliberate. Obsidian Markdown lists are the initial task workflow; ToDoSian remains an optional mobile interface to evaluate. Trello app presence was not established. |
| 5. OneDrive | User chose to disconnect and uninstall it from the active Windows installation; assess alternatives for future backups. | User copied OneDrive material to F: and checked a sample of files/folders, reporting that they matched. Unlinking/uninstalling OneDrive from the active C: Windows installation was requested, but completion was not confirmed in this audit. OneDrive on the separate D: Windows installation does not run while that OS is not booted; removing it there is not urgent. |
| 6. OBS / Shotcut | Retain as occasional tools; defer use until video is needed. | They have complementary roles: OBS records; Shotcut edits. They are not startup necessities. The machine is below Shotcut's published 8 GB / 4-core HD recommendation; SD/light editing is a better fit. |
| 7. Offline AI architecture | Retain AnythingLLM Desktop + Ollama for local AI, launched on demand. Freeze the current model basket until the six-month review. | Recorded baseline: AnythingLLM 1.16.0, Ollama provider, Qwen3.5 2B Q4_K_M, Chat mode; benchmark 41.8 sec / 7.16 tokens per second. Strict no-Internet behavior is not yet verified: check local LLM and embedder selections, telemetry preference, and Ollama cloud setting. Do not change the embedding provider without reviewing the re-indexing implications. |
| 8. AI resource map | Use one local AI request at a time; keep Ollama off until needed and close it after use. | Model sizes captured: Qwen2.5 1.5B ~986 MB, Granite 3.3 2B ~1.5 GB, Qwen3.5 2B Q4 ~1.9 GB, nomic-embed-text ~274 MB. These are disk footprints, not measured RAM usage. Context length and parallel requests add memory pressure. No fresh Task Manager resource measurements were taken. |

## Follow-ups to carry forward

- [ ] Confirm OneDrive was unlinked and uninstalled from the active C: Windows installation. Do not delete the cloud account or the F: backup as part of this step.
- [ ] Keep the C: and D: OneDrive snapshots separate; evaluate a durable backup method beyond the local F: copy.
- [ ] At a later review, decide whether the uv-managed Astral Python 3.11.15 runtime is still needed.
- [ ] Include AnythingLLM Desktop storage in the backup plan. Its local database, documents, vectors, and chats are stored under `%APPDATA%\anythingllm-desktop\storage` by default.
- [ ] Confirm AnythingLLM local LLM/embedder and privacy settings if strict offline operation is required. Keep current models and embeddings unchanged until the six-month audit.
- [ ] Review ToDoSian only when ready to validate the mobile workflow against the Active-Projects vault. Start with a backed-up test folder.
- [ ] Identify the anti-malware process and reason for its background activity in a separate security/startup review; do not disable protection as an optimization shortcut.

## Six-month review

Scheduled review date: **2027-04-06**. Use [[Ecosystem V1 - Six-Month Software Review]] as the checklist.

## Source references

- [Microsoft: unlink or uninstall OneDrive](https://support.microsoft.com/en-US/onedrive/turn-off-disable-or-uninstall-onedrive)
- [AnythingLLM: desktop storage locations](https://docs.anythingllm.com/installation-desktop/storage)
- [AnythingLLM: desktop privacy](https://docs.anythingllm.com/installation-desktop/privacy)
- [Ollama: memory, context, concurrency, and loaded models](https://github.com/ollama/ollama/blob/main/docs/faq.mdx)
- [Shotcut: system requirements](https://www.shotcut.org/FAQ/)


##Links

[[next-audit-review]]



