# Ecosystem V1 — Multi-Vault Operating Architecture Plan

**Purpose:** Revise the proposed V1 around the full three-vault ecosystem, including CRM, reusable templates, operational governance references, and mobile use. This is a design proposal for review; it does not implement CRM folders or move/copy client data.

## V1 scope is broader than CRM

CRM is one example of a cross-vault lifecycle, not the whole architecture exercise. The same mapping and ownership decisions apply to templates, platform/LinkedIn/Website governance, service and capability references, and mobile operating materials. Each item should have an identified owner, execution counterpart (if needed), sync treatment, and mobile-use classification.

## Architectural frame

The three vaults each have a CRM folder, but each folder serves a distinct lifecycle role. A CRM folder in each vault does not mean three independently edited client databases.

| Vault | CRM role | Record responsibility |
|---|---|---|
| **Active-Projects** | First entry point and execution workspace | Platform applications, leads/prospects, opportunities, quotes in progress, follow-ups, active delivery links and working records. |
| **ObsidianVault control center** | Business control and onboarded-client register | Canonical onboarded client record, relationship context, approved service fit, commercial outcome, and links to delivery and agreement records. Existing `09-crm` folders provide a scaffold but are currently empty. |
| **Knowledge Vault** | Decision-governed backup and historical continuity | Last-state snapshots received from Active-Projects and ObsidianVault before deletion or on agreed lifecycle checkpoints; selected moved/curated records when explicitly decided. |

### Proposed source of truth by record

- **Before onboarding:** Active-Projects owns the live lead/opportunity record.
- **After onboarding:** ObsidianVault owns the client master record. Active-Projects retains the execution record needed to deliver work, with a link to the control-center client master.
- **Backup/history:** Knowledge Vault holds the retained last-state copy or approved moved record, with origin, timestamp, version/hash, and disposition recorded.
- **Service, capability, pricing policy, and reusable methods:** ObsidianVault remains canonical. Active-Projects receives only approved execution references. Knowledge receives a snapshot or curated move when decided.

This assigns ownership by lifecycle stage and record type, not by assuming that the same note should be freely edited in all three places.

## Proposed CRM layout

### Active-Projects — intake and execution

```text
07-CRM/
├── 00-CRM-Dashboard.md
├── 01-Platforms/<platform>/
│   ├── 00-Platform-Record.md
│   ├── 01-Applied/
│   └── 02-Converted/              # links to canonical opportunity/client records
├── 02-Leads-and-Prospects/<record-id>/
│   ├── 00-Opportunity-Record.md
│   ├── 01-Relationship-Notes/
│   ├── 02-Follow-Ups/
│   └── 03-Quotations/
└── 03-Active-Client-Delivery/<client-id-or-project-id>/
    ├── 00-Execution-Record.md
    ├── 01-Final-Commercials.md
    ├── 02-Agreement-Reference.md
    └── 03-Delivery-Link.md
```

The sales record begins here. On conversion, update status and create/register the client in ObsidianVault. Keep Active-Projects delivery material where it is operationally needed; add links to the control-center master rather than creating a second unrelated identity.

### ObsidianVault — onboarded-client control

```text
09-crm/
├── clients/<client-id>/
│   ├── 00-Client-Master.md
│   ├── 01-Contacts-and-Relationship.md
│   ├── 02-Services-and-Engagements.md
│   ├── 03-Commercial-Outcome.md
│   └── 04-Agreement-Register.md
├── leads/                         # only if retained after transfer; otherwise link/index
├── prospects/                     # pre-onboarding visibility if useful
├── follow-ups/
├── proposal-tracking/
└── transfer-register/
```

Adapt the existing empty folders rather than replacing the CRM concept. The client master records onboarding and links back to the originating Active-Projects record, active delivery, quotation/final price, and agreement location. Whether pre-onboarding leads remain indexed here is an open decision; they should not become a second competing record.

### Knowledge Vault — retained state and archive

```text
09-crm/
├── 00-CRM-Archive-Index.md
├── snapshots/<source-vault>/<entity-id>/<timestamp-or-version>/
│   ├── <captured-note-or-files>
│   └── snapshot-manifest.md
├── moved-records/<entity-id>/       # only for an approved move
└── deletion-and-transfer-log.md
```

A snapshot is a recoverable last state, not a live operational copy. A moved record should leave a pointer or transfer record at its former location where practical. Do not automatically prune retained snapshots until retention rules are agreed.

## End-to-end workflow

1. **Capture in Active-Projects.** Create a stable record ID for a platform application, lead, or opportunity. Record platform, service interest, status, next action, and links. Keep one canonical live opportunity record.
2. **Qualify against control-center sources.** Use the relevant service-catalog, capability/evidence, delivery-method, and pricing references. ObsidianVault remains canonical for these policies and claims. Copy only the approved subset into Active-Projects using reviewed one-way reference refreshes.
3. **Quote and negotiate in context.** Store each dated/versioned quotation in the Active opportunity. Record scope, currency, assumptions, validity, and status. On acceptance, record final negotiated pricing and its variance/reason; do not alter the canonical pricing policy to represent a client exception.
4. **Onboard and register.** After the defined onboarding trigger is met, create/update the canonical client master in ObsidianVault `09-crm/clients`. Link the origin record and Active-Projects delivery record. Record which source owns each field/document.
5. **Execute in Active-Projects.** Keep working notes, project tasks, delivery resources, and operational follow-ups in the execution vault. Control center holds the onboarded-client overview and links/decision context.
6. **Checkpoint to Knowledge.** At agreed events (onboarding, material commercial/relationship change, closeout, planned archive, and always before deletion), capture the required last state from each source vault. Record source path, event, timestamp, version/hash, included attachments, and verification result in the manifest.
7. **Move or delete only after verification.** Verify the snapshot can be opened and matches the source state; record the transfer/deletion decision in Knowledge. Keep a pointer/tombstone at the source to prevent confusion or accidental re-creation. No automatic deletion in V1.
8. **Close and learn.** Close delivery and update the client master. Promote only generalized, approved, non-confidential learning into ObsidianVault methods/services. Retain the Knowledge snapshot according to the agreed policy.

## Service, capability, and commercial mapping

| Control-center source | Active-Projects counterpart | Onboarding/control counterpart | Knowledge handling |
|---|---|---|---|
| Service catalog and service-specific delivery methods | Approved service brief, method, and required checklist in `04-Resources/Control-Center-References/` | Client master links the agreed service and engagement; do not fork service definition | Snapshot/move only by decision or before source deletion/change history requires it |
| Capability and evidence mapping | Execution checklist/evidence links relevant to the selected service and platform application | Client master/engagement notes identify capability commitments and evidence links | Preserve last-state snapshots at lifecycle checkpoints; keep reusable learning separate from private client evidence |
| Pricing philosophy, rates, service pricing, negotiation and segment guidance | Approved commercial reference; opportunity quotations and final negotiated pricing remain transaction records | Client master records commercial outcome and links to quotation/final terms | Snapshot client-specific quote/final terms and approved policy versions as required; protect confidential content |
| Platform profile and positioning | Application and response records per platform | Client record links the origin platform and conversion | Retain selected source state if the record is archived or deleted |
| Agreement/MoU | Execution record contains the working agreement link/copy according to policy | Client master maintains agreement status, date, parties, and secure location reference | Capture last state before any deletion or move, subject to agreed access/retention controls |

**Current inventory caveat:** the control center has service-catalog and pricing notes, plus a Gig 1 audit and capability template. A general capability register was not found. Confirm whether the Gig 1 audit is approved/current before using it as a capability source; if needed, establish the general map in ObsidianVault first.

## Cross-vault template assessment

Templates may be different in Active-Projects and ObsidianVault. V1 should assess them by function and lifecycle rather than force a single shared template set.

| Template class | Control-center role | Active-Projects role | V1 decision rule |
|---|---|---|---|
| Business planning, service design, platform governance, website/content strategy | Design and govern the business/system | Usually a concise operational reference or execution-specific template | Keep specialized templates in ObsidianVault unless there is a concrete execution/mobile use. |
| Project, task, notes, resources | Define reusable business standards | Create and run projects | Compare current templates field-by-field; share only if the same workflow and fields are useful in both vaults. |
| Client intake, discovery, quotation, onboarding, meeting, change request, case study | Canonical reusable method/template | Use during live client work | Candidate for common structure or a controlled execution copy; verify confidentiality, usability, and mobile entry first. |
| Daily/weekly reviews and vault governance | Control-center maintenance | Execution planning and project review | Keep separate if purpose differs; reuse only where semantics match. |

For every template, record: name, purpose, canonical vault, counterpart path, differences, whether fields are common, mobile suitability, client-facing suitability, sync method, and update owner. A common template means aligned structure and controlled updates; it does not require one physical file shared by both vaults.

## Operational governance and mobile readiness

Governance notes relevant to platforms, LinkedIn, and Website must have approved execution-time counterparts in Active-Projects when they guide live work or client communication. ObsidianVault remains canonical; Active-Projects receives a curated, conflict-aware copy set. The Active-Projects vault is the mobile sync boundary for V1, keeping the Control Center off the phone.

For each candidate note, classify:

- **Operational:** needed to prepare, decide, or carry out live platform, LinkedIn, Website, or client work.
- **Client-facing reference:** suitable to consult or communicate from in front of a client (services, capabilities, SOPs, principles). This is not the same as permission to publish or send the note.
- **Internal-only:** contains strategy, private reasoning, credentials, sensitive commercial details, or unfinished policy; keep out of the mobile-ready set unless there is a clear need and access handling is agreed.
- **Deferred:** useful for future work but not required for V1 execution.

Mobile readiness should be an explicit mapping field, not inferred from a note being in Active-Projects. The review should check concise titles, usable navigation, offline availability, links/attachments, stale-copy/conflict behavior, and whether the material is appropriate to have available during client interactions. Client-sensitive CRM records and agreements need an explicit data/access decision before mobile sync; the general goal of client-front-ending does not itself authorize exposing every record on the phone.

Proposed execution reference areas (exact paths and source notes to be selected during inventory):

```text
04-Resources/Control-Center-References/
├── Services-and-Capabilities/
├── SOPs-and-Principles/
├── Platforms/
├── LinkedIn/
├── Website/
└── Template-Map.md
```

These are candidate logical groups, not a commitment to copy whole control-center folders. Only approved, operationally useful notes enter the mobile-synced Active-Projects vault.

## Shared mapping register

Use one cross-vault register for CRM and all other mapped assets, with fields such as:

| Field | Purpose |
|---|---|
| Asset ID / source path | Stable identity and canonical location |
| Asset type | CRM record, template, governance, service, SOP, capability, platform, LinkedIn, Website, or other |
| Canonical owner | Vault and note that controls authoritative updates |
| Execution counterpart | Active-Projects path, if required |
| Knowledge disposition | Snapshot, move, or none; include checkpoint and retention decision |
| Sync direction/method | Manual one-way, controlled copy, or no sync |
| Mobile classification | Required, optional, or excluded; reason |
| Client-facing classification | Consultable, internal-only, or approved shareable artifact |
| Review/version state | Last reviewed, current status, and conflict/action needed |

This register prevents the CRM map from becoming a separate set of rules and lets future platform/SOP/template additions follow the same governance.

## V1 limit and release sequence

Keep V1 human-reviewed and traceable. Do not start with automatic bidirectional sync, automatic record promotion, or automatic deletion. A sensible pilot is one platform and one service, with the minimum governance/SOP/template references needed to support that work, exercised through application → quotation → conversion/onboarding → client master → delivery link → Knowledge snapshot. Review the same selected execution references on mobile during a sanitized client-work simulation. Expand after that path, mobile usability, and backup verification are accepted.

1. **Design approval:** confirm vault roles, record ownership, client ID scheme, privacy, retention, agreement storage, and mobile boundaries.
2. **Cross-vault inventory:** map CRM, templates, platform/LinkedIn/Website governance, services, capabilities, SOPs, and principles; identify canonical owners and mobile/client-facing classifications.
3. **Reference and template decisions:** select the initial execution copy set; compare template functions and decide what is common, distinct, or linked.
4. **CRM skeleton:** create the three CRM areas and indexes; adapt the existing control-center `09-crm` scaffold and Active-Projects lifecycle without broad restructuring.
5. **Sample lifecycle:** use fictional/sanitized data; verify cross-vault links, transfer/backup manifests, selected mobile references, and client-facing navigation.
6. **Pilot release:** process one real opportunity only after the sample and access/backup boundaries are approved.
7. **Review and scale:** adjust from observed use; then extend to other platforms, services, templates, SOPs, and Website/LinkedIn work.

## Decisions to settle together

- What exact event makes a record an “onboarded client” and transfers ownership to ObsidianVault?
- After onboarding, which client details remain as a live working record in Active-Projects, and which are links to the control-center master?
- Should pre-onboarding leads/prospects also appear in ObsidianVault, or remain only in Active-Projects until conversion?
- Which Knowledge Vault data is copied as backup, and which records may be moved? How are snapshots named, verified, and retained?
- Which service and platform form the pilot? Is Process Mapping still first?
- Which platform, LinkedIn, and Website governance notes are required during execution and appropriate for mobile access?
- Which services, capabilities, SOPs, and principles are safe and useful as client-front-ending references, and which remain internal-only?
- Which templates should share structure across vaults, which should remain distinct, and which need only a link or mobile-ready derivative?
- What navigation and offline/mobile requirements make an execution reference usable during client interactions?
- What fields define capability commitments and evidence for each service?
- Where are signed agreements/MoUs stored, and what access, encryption, and retention rules apply?
- Which state transitions require a Knowledge snapshot, and who confirms snapshot verification before deletion?
