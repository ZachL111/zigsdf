# zigsdf

`zigsdf` is a compact Zig repository for graphics, centered on this goal: Generate signed-distance samples for circles, boxes, and glyph-like fixtures.

## Reason For The Project

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Zigsdf Review Notes

Start with `geometry span` and `atlas pressure`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## What It Does

- `fixtures/domain_review.csv` adds cases for geometry span and atlas pressure.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/zigsdf-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `geometry span` and `atlas pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## How It Is Put Together

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `geometry span`, `atlas pressure`, `shader drift`, and `render budget`.

The Zig implementation avoids hidden state so fixture changes are easy to reason about.

## Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Check It

The check exercises the source code and the review fixture. `stale` is the high score at 199; `stress` is the low score at 144.

## Boundaries

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
