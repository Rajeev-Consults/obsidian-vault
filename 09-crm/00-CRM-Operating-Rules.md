# CRM — Control Center Operating Rules

**Role:** ObsidianVault CRM holds relationship/client context and the calibrated client rating used to inform future engagements and pricing. It is interconnected with Active-Projects and the Knowledge backup vault.

## Boundaries

- When a relationship exists, deliberately copy the agreed client details from Active-Projects into the corresponding Control Center CRM record. The relationship trigger and field schema are to be defined during the sprint.
- An onboarded client is one who has awarded a gig, job, project, assignment, or contract. This is distinct from first establishing a relationship.
- Proposal-specific CRM details do not enter this CRM. Keep reusable proposal SOPs, MOCs, and templates in the Control Center; keep live proposal details in Active-Projects.
- Use Active-Projects feedback on relationship and delivery to calibrate the special CRM rating here. The rating rubric and update cadence remain to be defined.
- Agreements/MoUs are represented under each vault's internal rules. Link related Active-Projects and Knowledge entries when available.
- Knowledge Vault is the backup for data from this vault and Active-Projects. The first scheduled capture is after the sprint; proposed cadence is six months, with targeted snapshots before deletion/move or major restructuring.

## Existing CRM areas

- `clients` — onboarded client records
- `relationship-notes` — agreed relationship context and feedback
- `follow-ups` — Control Center follow-up and review actions
- `leads` / `prospects` — use only for relationship context that belongs here; no proposal-specific records
- `proposal-tracking` — reusable process/summary register only; not proposal-specific CRM details

No client records or ratings were created as part of this foundation.
