import pytest
from day2 import invalid_entries, invalid_sum, is_valid, is_valid2


@pytest.mark.parametrize(
    "number",
    [
        1,
        101,
        9001,
    ],
)
def test_valid_ids(number):
    assert is_valid(number)


@pytest.mark.parametrize(
    "number",
    [
        11,
        22,
        1010,
        1188511885,
    ],
)
def test_invalid_ids(number):
    assert not is_valid(number)


@pytest.mark.parametrize(
    "number",
    [
        12,
    ],
)
def test_valid_part2(number):
    assert is_valid2(number)


@pytest.mark.parametrize(
    "number",
    [
        111,
        999,
        222222,
        565656,
    ],
)
def test_invalid_part2(number):
    assert not is_valid2(number)


def test_valid2():
    inputs = [
        (11, 22),
        (95, 115),
        (998, 1012),
        (1188511880, 1188511890),
        (222220, 222224),
        (1698522, 1698528),
        (446443, 446449),
        (38593856, 38593862),
        (565653, 565659),
        (824824821, 824824827),
        (2121212118, 2121212124),
    ]
    assert list(invalid_entries(inputs, valid=is_valid2)) == [
        11,
        22,
        99,
        111,
        999,
        1010,
        1188511885,
        222222,
        446446,
        38593859,
        565656,
        824824824,
        2121212121,
    ]


def test_sum1():
    inputs = [
        (11, 22),
        (95, 115),
        (998, 1012),
        (1188511880, 1188511890),
        (222220, 222224),
        (1698522, 1698528),
        (446443, 446449),
        (38593856, 38593862),
    ]
    assert invalid_sum(inputs, valid=is_valid) == 1227775554


def test_sum2():
    inputs = [
        (11, 22),
        (95, 115),
        (998, 1012),
        (1188511880, 1188511890),
        (222220, 222224),
        (1698522, 1698528),
        (446443, 446449),
        (38593856, 38593862),
        (565653, 565659),
        (824824821, 824824827),
        (2121212118, 2121212124),
    ]
    assert invalid_sum(inputs, valid=is_valid2) == 4174379265
