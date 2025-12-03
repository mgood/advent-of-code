def max_joltage(batteries: int, num_enabled: int = 2):
    digits = list(map(int, str(batteries)))
    out = 0
    for remaining in range(num_enabled - 1, -1, -1):
        pos, digit = max(
            enumerate(digits[: len(digits) - remaining]), key=lambda x: x[1]
        )
        out = out * 10 + digit
        digits = digits[pos + 1 :]
    return out


if __name__ == "__main__":
    import sys

    print(sum(max_joltage(int(line), 12) for line in sys.stdin))
