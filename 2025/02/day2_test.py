import pytest
from day2 import invalid_sum, is_valid


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


def test_sum():
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
    assert invalid_sum(inputs) == 1227775554
