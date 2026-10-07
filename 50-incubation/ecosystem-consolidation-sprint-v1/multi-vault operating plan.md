# Ecosystem V1 — Multi-Vault Operating Architecture Plan

**Purpose:** Revise the proposed V1 around the full three-vault ecosystem, including CRM, reusable templates, operational governance references, and mobile use. This is a design proposal for review; it does not implement CRM folders or move/copy client data.

## V1 scope is broader than CRM

CRM is one example of a cross-vault lifecycle, not the whole architecture exercise. The same mapping and ownership decisions apply to templates, platform/LinkedIn/Website governance, service and capability references, and mobile operating materials. Each item should have an identified owner, execution counterpart (if needed), sync treatment, and mobile-use classification.

## Decisions clarified by the ecosystem architect

- The three vaults co-exist and are interconnected; each has a CRM area with a distinct role.
- A proposal/application is not an onboarded client. An **onboarded client** is one who has awarded a gig, job, project, assignment, or contract.
- Proposal-specific CRM details remain in Active-Projects. Proposal SOPs, MOCs, and templates belong in the Control Center.
- When a relationship exists, client details are copied into both Active-Projects and ObsidianVault. The copy is deliberate, not automatic. Active-Projects feedback informs a special CRM rating calibrated in ObsidianVault for future engagement and pricing decisions.
- The Knowledge Vault backs up data from both operating vaults. A full capture is planned every six months or year; the first run is after the sprint.
- Agreements/MoUs are represented in all three vaults according to each vault's internal rules; exact file/record handling remains to be defined.
- The first platform set is Upwork, Fiverr, Contra, Freelancer, LinkedIn, and the JayaSwara website. Mapped execution material should be available through Active-Projects mobile sync to support client visits, meetings, and capability/portfolio conversations.
- Process Mapping is first. The sprint uses Capture → Clarify → Organize → Systematize → Scale, with each step treated as a potential income-generation opportunity.
- The template set is still being developed. Commonality and vault-specific differences will be decided during the sprint as actual use cases emerge.
- Capability/evidence fields will be derived from capabilities defined across platforms, including the Tier 1/2/3 focus already outlined in Fiverr planning; this is not yet a finalized general register.

## Architectural frame

The three vaults each have a CRM folder, but each folder serves a distinct lifecycle role. A CRM folder in each vault does not mean three independently edited client databases.

| Vault | CRM role | Record responsibility |
|---|---|---|
| **Active-Projects** | First entry point and execution workspace | Platform applications, leads/prospects, opportunities, quotes in progress, follow-ups, active delivery links and working records. |
| **ObsidianVault control center** | Business control and onboarded-client register | Canonical onboarded client record, relationship context, approved service fit, commercial outcome, and links to delivery and agreement records. Existing `09-crm` folders provide a scaffold but are currently empty. |
| **Knowledge Vault** | Decision-governed backup and historical continuity | Last-state snapshots received from Active-Projects and ObsidianVault before deletion or on agreed lifecycle checkpoints; selected moved/curated records when explicitly decided. |

### Proposed source of truth by record

- **Proposal/application only:** Active-Projects owns proposal-specific CRM details; these do not enter the Control Center CRM. The Control Center owns reusable proposal methods, SOPs, MOCs, and templates.
- **Once a relationship exists:** client details are deliberately copied into both Active-Projects and ObsidianVault. Exact shared fields and update rules will be defined during CRM schema work.
- **Onboarding threshold:** an award of a gig, job, project, assignment, or contract marks the person/organization as an onboarded client. This is distinct from the earlier relationship-copy point.
- **Control-center CRM:** maintains the client context and calibrated CRM rating; Active-Projects feedback informs future engagement and pricing decisions there.
- **Active execution:** Active-Projects remains the entry point and working environment for platform activity, proposals, delivery, client interaction, and project details.
- **Backup/history:** Knowledge Vault receives scheduled captures from both Active-Projects and ObsidianVault, plus risk-triggered snapshots as defined below.
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

Adapt the existing empty folders rather than replacing the CRM concept. Create the Control Center client record when a relationship exists, by deliberate copy from Active-Projects. Proposal-specific CRM details remain in Active-Projects. Once an award is made, mark the client as onboarded. Calibrate the Control Center CRM rating using feedback from Active-Projects. Shared fields, rating rubric, and update cadence remain to be defined.

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

1. **Capture in Active-Projects.** Record platform applications, proposals, and opportunities here. Proposal-specific CRM details stay here. Use stable IDs and link platform, service, status, and next action.
2. **Relationship begins.** When a relationship exists, deliberately copy the agreed client details into the matching Control Center CRM record. This may precede an award; it does not transfer proposal-specific CRM detail.
3. **Qualify and prepare.** Use Control Center service, capability/evidence, SOP, pricing, and governance sources. The mapped operational subset is available in Active-Projects and on mobile. Track the five Process Mapping steps as work and potential income opportunities.
4. **Quote and negotiate in Active-Projects.** Keep dated/versioned proposal and quotation details in the opportunity record. Reusable proposal procedures/templates remain in ObsidianVault.
5. **Award and onboard.** An awarded gig/job/project/assignment/contract sets onboarded status. Ensure the Control Center client record reflects the award and links to the Active-Projects execution record. Calibrate the Control Center CRM rating using Active-Projects feedback.
6. **Execute and update.** Keep live project work in Active-Projects. Send agreed client feedback and relationship updates to the Control Center record for rating and future engagement/pricing decisions. Define shared fields and update cadence during schema work.
7. **Back up both source vaults.** Perform the first backup run when the sprint is complete, then a full capture every six months or year (recommended starting cadence: six months). Capture agreed data from both Active-Projects and ObsidianVault into Knowledge, with source, date, scope, and verification recorded.
8. **Handle high-risk changes.** Take an additional targeted snapshot before deleting or moving source notes and before major restructuring. Consider a targeted snapshot after a material signed-agreement or commercial change if waiting for the periodic run creates unacceptable recovery loss. No automatic deletion in V1.
9. **Verify before deletion/move.** Confirm the Knowledge copy is readable and complete, record the decision and snapshot reference, then delete/move only under the internal rules of the source vault. Keep a pointer/transfer record when appropriate.
10. **Close and learn.** Update client records in their assigned vaults; promote generalized, approved learning into Control Center methods/services. The next scheduled Knowledge capture preserves the resulting vault states.

## Service, capability, and commercial mapping

| Control-center source | Active-Projects counterpart | Onboarding/control counterpart | Knowledge handling |
|---|---|---|---|
| Service catalog and service-specific delivery methods | Approved service brief, method, and required checklist in `04-Resources/Control-Center-References/` | Client master links the agreed service and engagement; do not fork service definition | Snapshot/move only by decision or before source deletion/change history requires it |
| Capability and evidence mapping | Execution checklist/evidence links relevant to the selected service and platform application | Client master/engagement notes identify capability commitments and evidence links | Preserve last-state snapshots at lifecycle checkpoints; keep reusable learning separate from private client evidence |
| Pricing philosophy, rates, service pricing, negotiation and segment guidance | Approved commercial reference; opportunity quotations and final negotiated pricing remain transaction records | Client master records commercial outcome and links to quotation/final terms | Snapshot client-specific quote/final terms and approved policy versions as required; protect confidential content |
| Platform profile and positioning | Application and response records per platform | Client record links the origin platform and conversion | Retain selected source state if the record is archived or deleted |
| Agreement/MoU | Represented/stored according to Active-Projects rules | Represented/stored according to Control Center rules | Represented/stored according to Knowledge backup rules; capture and verify as part of the agreed backup process |

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

Keep V1 human-reviewed and traceable. Do not start with automatic bidirectional sync, automatic record promotion, or automatic deletion. A sensible pilot is one platform and Process Mapping, with the minimum governance/SOP/template references needed to support that work, exercised through application/proposal → relationship details copied to both operating vaults → award/onboarding → Control Center rating informed by Active-Projects feedback → delivery → Knowledge backup. Review selected execution references on mobile during client-work preparation. Expand after the cross-vault path, mobile usability, and backup verification are accepted.

1. **Design approval:** define when a relationship begins, the award-based onboarding trigger, shared client fields, Control Center CRM rating rubric, client ID scheme, privacy, retention, agreement rules, and mobile boundaries.
2. **Cross-vault inventory:** map CRM, templates, platform/LinkedIn/Website governance, services, capabilities, SOPs, and principles; identify canonical owners and mobile/client-facing classifications.
3. **Reference and template decisions:** select the initial execution copy set; compare template functions and decide what is common, distinct, or linked.
4. **CRM skeleton:** create the three CRM areas and indexes; adapt the existing control-center `09-crm` scaffold and Active-Projects lifecycle without broad restructuring.
5. **Sample lifecycle:** use fictional/sanitized data; verify cross-vault links, transfer/backup manifests, selected mobile references, and client-facing navigation.
6. **Initial Knowledge backup:** after sprint completion, capture the agreed data/snapshots from both operating vaults and verify recovery before any planned deletion/move.
7. **Pilot release:** process one real opportunity only after the sample and access/backup boundaries are approved.
8. **Review and scale:** adjust from observed use; then extend to other platforms, services, templates, SOPs, and Website/LinkedIn work.

## Decisions to settle together

- What specifically constitutes “a relationship” for copying client details to both Active-Projects and ObsidianVault, and which fields are copied?
- How is the Control Center CRM rating scored, who updates it, and what Active-Projects feedback informs it?
- Which proposal metadata, if any, may be summarized in Control Center without bringing proposal-specific CRM details into that vault?
- Is the periodic Knowledge capture a full-vault copy or a defined set of vault data? Which files/attachments are in scope?
- Should the full Knowledge backup cadence begin at six months (recommended) or one year, and what retention/versioning rules apply?
- Which high-risk changes require an immediate targeted snapshot beyond the periodic schedule?
- How should all-three-vault agreement/MoU representation work under each vault’s internal rules?
- Process Mapping is first. Which of Upwork, Fiverr, Contra, Freelancer, LinkedIn, or the website is the first pilot channel?
- Which platform, LinkedIn, and Website governance notes are required during execution and appropriate for mobile access?
- Which services, capabilities, SOPs, and principles are safe and useful as client-front-ending references, and which remain internal-only?
- Which templates should share structure across vaults, which should remain distinct, and which need only a link or mobile-ready derivative?
- What navigation and offline/mobile requirements make an execution reference usable during client interactions?
- What fields define capability commitments and evidence for each service?
- Where are signed agreements/MoUs stored, and what access, encryption, and retention rules apply?
- Which state transitions require a Knowledge snapshot, and who confirms snapshot verification before deletion?
