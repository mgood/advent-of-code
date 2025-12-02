import re


def is_valid(id: int):
    s = str(id)
    digits = len(s)
    if digits % 2 != 0:
        return True
    return s[: digits // 2] != s[digits // 2 :]


def invalid_entries(ranges, valid=is_valid):
    return (id for (lo, hi) in ranges for id in range(lo, hi + 1) if not valid(id))


def invalid_sum(ranges, valid=is_valid):
    return sum(invalid_entries(ranges, valid=valid))


def is_valid2(id: int):
    return not re.match(r"^(\d+)\1+$", str(id))


if __name__ == "__main__":
    import sys

    input = sys.stdin.read().strip()
    ranges = [tuple(map(int, r.split("-"))) for r in input.split(",")]
    print(invalid_sum(ranges, valid=is_valid2))
