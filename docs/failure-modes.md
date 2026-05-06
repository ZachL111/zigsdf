# Failure Modes

For `zigsdf`, I would look first for these mistakes:

- `geometry span` cases moving lanes without a matching threshold change.
- `shader drift` scoring higher after drag increases.
- Duplicate fixture ids hiding a stale golden row.
- README examples drifting away from the verifier.

The local checks are intentionally strict about these cases.
