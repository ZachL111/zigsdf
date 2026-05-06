# Fuzzing Notes

The fuzz pass is deliberately local: it checks invariants without needing a long-running fuzzer.

`fixtures/fuzz/mutations.csv` mutates each golden case in a predictable direction. `fixtures/fuzz/boundary-cases.jsonl` keeps threshold-adjacent cases separate so the verifier can catch off-by-one mistakes.

This is not a replacement for a full fuzzing harness. It is a cheap local guard that fits the size of the repository.
