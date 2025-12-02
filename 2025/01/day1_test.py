import pytest
from day1 import count_clicks, parse, rotate


@pytest.mark.parametrize(
    "rotation,expected",
    [
        ("L68", -68),
        ("L30", -30),
        ("R48", 48),
        ("L5", -5),
        ("R60", 60),
    ],
)
def test_parse(rotation: str, expected: int):
    assert parse(rotation) == expected


@pytest.mark.parametrize(
    "start,rotation,expected",
    [
        (50, "L68", 82),
        (82, "L30", 52),
        (52, "R48", 0),
        (0, "L5", 95),
    ],
)
def test_rotate(start: int, rotation: str, expected: int):
    assert rotate(start, rotation) == expected


@pytest.mark.parametrize(
    "start,rotation,expected",
    [
        (50, "L68", (82, 1)),
        (82, "L30", (52, 0)),
        (52, "R48", (0, 1)),
        (0, "L5", (95, 0)),
        (95, "R60", (55, 1)),
        (50, "R1000", (50, 10)),
    ],
)
def test_clicks(start: int, rotation: str, expected: tuple[int, int]):
    assert count_clicks(start, rotation) == expected
