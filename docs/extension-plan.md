# Extension Plan

## Current Shape

`zigsdf` has a compact core implementation, golden fixtures, extended examples, and a repository audit script. The model is intentionally small enough to inspect by hand while still exercising real control flow and validation.

## Near-Term Enhancements

- Add a parser or loader for the extended example format.
- Promote the highest-risk example into the main verification path.
- Add a command that prints a concise decision report.
- Add one negative test around malformed or missing input.
- Keep the local verification command stable for repeatable review.

## Example Coverage

The extended example set currently includes 2 accept cases and 4 review cases. This is meant to exercise both normal and cautious paths without depending on external systems.

## Design Boundaries

This repository does not claim production use. It is a self-contained engineering project with deterministic data, local tests, and documented limitations.
