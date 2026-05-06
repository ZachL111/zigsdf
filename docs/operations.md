# Operations Guide

## Project Focus

`zigsdf` is centered on graphics work in Zig. The technical target is: Generate signed-distance samples for circles, boxes, and glyph-like fixtures.

## Input Contract

The model expects five bounded numeric signals:

- `demand`: pressure from incoming work, events, or records.
- `capacity`: available room to process or absorb that pressure.
- `latency`: delay cost for the current path.
- `risk`: exposure from uncertainty, malformed input, or unsafe state.
- `weight`: project-specific importance for the scenario.

The score is deterministic. The current threshold is 166. Risk has a penalty of 6, latency has a penalty of 2, and weight contributes a bonus of 5.

## Review Workflow

1. Read `metadata/project.json` to confirm the expected model constants.
2. Inspect `fixtures/cases.csv` for the compact golden cases.
3. Inspect `examples/extended_cases.csv` for broader edge-oriented examples.
4. Run `scripts/verify.ps1` for the language-level checks.
5. Run `scripts/audit.ps1` for repository-level validation plus the verifier.

## Failure Modes

- A fixture can drift from the scoring constants after a code edit.
- A README can accidentally claim external usage that is not part of this repository.
- A language verifier can pass while project metadata is stale.
- Extended examples can become misleading if they are not regenerated with the same constants.

## Maintenance Notes

Keep the public API small. New features should either add a new input adapter, add a clearer fixture class, or strengthen validation around an existing path. Avoid adding network calls or hosted services unless the repository is explicitly expanded to cover integration behavior.
