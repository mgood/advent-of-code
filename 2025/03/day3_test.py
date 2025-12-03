import pytest
from day3 import max_joltage


@pytest.mark.parametrize(
    "batteries,expected",
    [
        (987654321111111, 98),
        (811111111111119, 89),
        (234234234234278, 78),
        (818181911112111, 92),
    ],
)
def test_max_joltage(batteries, expected):
    assert max_joltage(batteries) == expected


@pytest.mark.parametrize(
    "batteries,expected",
    [
        (987654321111111, 987654321111),
        (811111111111119, 811111111119),
        (234234234234278, 434234234278),
        (818181911112111, 888911112111),
    ],
)
def test_max_joltage2(batteries, expected):
    assert max_joltage(batteries, num_enabled=12) == expected
