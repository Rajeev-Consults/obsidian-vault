---
type: periodic-review
program: Ecosystem V1
review_date: 2027-04-06
status: planned
tags:
  - ecosystem-v1
  - software-audit
  - periodic-review
---

# Ecosystem V1 — Six-Month Software Review

Related note: [[Ecosystem V1 - Software Audit Closeout]]

## Review purpose

Repeat the software and resource audit as a routine, evidence-led review. Compare the system with the planned service capabilities and actual use since launch. Avoid cleanup based only on app age or speculation.

## Review checklist

### Usage and capability fit

- [ ] Review which tools were actually used for client work and which capabilities/services they supported.
- [ ] Revisit the ObsidianVault capability, service catalog, and platform mapping.
- [ ] Check whether Active-Projects has been defined and populated from real project inputs.
- [ ] Decide whether Obsidian Markdown tasks and ToDoSian are sufficient; add ClickUp/Trello only if a concrete collaboration gap exists.
- [ ] Reassess OBS and Shotcut against actual video deliverables.

### Python and applications

- [ ] Verify Python, `pip`, and `py` defaults; check whether any projects now require specific versions.
- [ ] Decide whether the Astral/CPython 3.11.15 runtime managed under uv is still required.
- [ ] Review app installs, startup entries, background services, and updates; record measured evidence before removing tools.
- [ ] Confirm OneDrive status on the active installation and review backup alternatives.
- [ ] Check that the F: OneDrive copies remain readable and that a second independent backup exists if needed.
- [ ] Identify and review the reported anti-malware background activity without weakening real-time protection.

### Local AI and resource use

- [ ] Keep the current Ollama model basket intact until this review; now assess each model against real work needs.
- [ ] Record one idle baseline and one local-AI session's memory/CPU from Task Manager; use `ollama ps` to see model load and context.
- [ ] Measure one workload at a time: AnythingLLM chat, local document indexing, Ollama with VS Code, and Ollama with Obsidian.
- [ ] Confirm all intended offline workloads use local LLM and embedding providers; review telemetry and cloud features.
- [ ] Include AnythingLLM local storage in the backup routine.
- [ ] Update workload profiles using measured results, then decide whether any model or setting changes are justified.

## Guardrails

- Preserve a backup before changing application data, model files, embeddings, or vault integrations.
- Change one variable at a time and record the result.
- Keep Ollama and other resource-heavy tools out of Windows startup unless real usage demonstrates a need.
- Keep client-confidential data out of cloud services unless the applicable client agreement and privacy requirements permit it.


[[software-audit-closeout]]