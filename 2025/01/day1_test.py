import pytest
from day1 import *


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
def test_parse(rotation, expected):
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
def test_rotate(start, rotation, expected):
    assert rotate(start, rotation) == expected
