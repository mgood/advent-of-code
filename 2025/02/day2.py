def is_valid(id: int):
    s = str(id)
    digits = len(s)
    if digits % 2 != 0:
        return True
    return s[: digits // 2] != s[digits // 2 :]


def invalid_sum(ranges):
    return sum(
        id for (lo, hi) in ranges for id in range(lo, hi + 1) if not is_valid(id)
    )


if __name__ == "__main__":
    import sys

    input = sys.stdin.read().strip()
    ranges = [tuple(map(int, r.split("-"))) for r in input.split(",")]
    print(invalid_sum(ranges))
