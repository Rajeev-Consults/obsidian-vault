# Goose — Incubation Overview

## Status

Retained and paused.

Goose is the current lightweight local-agent candidate for Agni. Further configuration and capability testing are paused until completion of the Ecosystem Consolidation Sprint.

## Current configuration

- Application: Goose Desktop for Windows
    
- Model provider: local Ollama
    
- Active model: `qwen2.5:1.5b`
    
- Hardware context: Ryzen 3 laptop with 8 GB RAM
    
- External MCP extensions: none added
    
- Platform automation: not enabled
    
- Goose CLI: not installed
    

## Pilot findings

- Goose connected successfully to Ollama and responded correctly to a basic text-only prompt.
    
- A minimal tool-use test was unreliable: Goose selected an unintended file-writing action and gave an inaccurate explanation of the result afterward.
    
- This indicates that the current small local model is adequate for simple conversation and bounded analysis, but not yet trusted for autonomous tool selection or file changes.
    
- No system instability was observed during the basic test.
    

## Intended role for Agni v1

Agni will operate as a human-led decision-support assistant.

The human operator will:

- Log in to freelance platforms.
    
- Search opportunities and collect permitted job details.
    
- Decide whether to apply, submit proposals, communicate with clients, or take other external actions.
    

Agni will:

- Extract requirements from manually supplied job details.
    
- Compare opportunities against approved capabilities, keywords, and platform notes.
    
- Rank opportunities and explain the reasoning.
    
- Identify missing information, risks, and questions.
    
- Draft proposal outlines and tailored response material.
    
- Produce structured notes for human review.
    

## Operating boundaries

- No automated login, browsing, scraping, messaging, bidding, or proposal submission on freelance platforms.
    
- No unattended modification of the Obsidian vault.
    
- Any future file-writing or Obsidian integration must start with a designated review folder and human approval.
    
- No new extensions, MCP connections, recipes, or schedules during the Ecosystem Consolidation Sprint unless a specific sprint need justifies them.
    

## Relationship with Obsidian

Obsidian is the source of approved operating knowledge for Agni.

The completed vault should contain:

- Platform-specific human and agent task boundaries.
    
- Capability and keyword criteria.
    
- Service offers and proof points.
    
- Opportunity qualification rules.
    
- Proposal guidance.
    
- Approval gates and operating constraints.
    

After the sprint, Goose may read selected notes as context for a decision task. Any direct Obsidian connection or automated Markdown entry will be evaluated separately.

## Reassessment trigger

Reassess Goose after the Ecosystem Consolidation Sprint is complete.

The reassessment should test one representative Agni workflow using finalized platform notes and manually supplied opportunity data. Compare Goose against any then-current local-agent alternatives only when they can meet the same workflow within the laptop’s resource limits and platform rules.