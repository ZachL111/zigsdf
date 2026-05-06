# Review Journal

I treated `zigsdf` as a project where the smallest useful behavior should still be inspectable.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its graphics focus without claiming live deployment or external usage.

## Cases

- `baseline`: `geometry span`, score 150, lane `ship`
- `stress`: `atlas pressure`, score 144, lane `ship`
- `edge`: `shader drift`, score 175, lane `ship`
- `recovery`: `render budget`, score 158, lane `ship`
- `stale`: `geometry span`, score 199, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
