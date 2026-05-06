"""Casebook scoring primitives for zigsdf."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable


TERMS = ['geometry span', 'atlas pressure', 'shader drift', 'render budget']
CATEGORY = 'Graphics'


@dataclass(frozen=True)
class Case:
    case_id: str
    focus: str
    signal: int
    slack: int
    drag: int
    confidence: int
    pressure: int
    expected_score: int
    expected_lane: str


def score_case(case: Case) -> int:
    return case.signal * 2 + case.slack + case.confidence + case.pressure * 4 - case.drag * 3


def lane_for(score: int) -> str:
    if score >= 210:
        return "ship"
    if score >= 150:
        return "watch"
    return "hold"


def validate_case(case: Case) -> None:
    score = score_case(case)
    if score != case.expected_score:
        raise AssertionError(f"{case.case_id} score {score} != {case.expected_score}")
    lane = lane_for(score)
    if lane != case.expected_lane:
        raise AssertionError(f"{case.case_id} lane {lane} != {case.expected_lane}")


def validate_cases(cases: Iterable[Case]) -> int:
    count = 0
    for case in cases:
        validate_case(case)
        count += 1
    return count
