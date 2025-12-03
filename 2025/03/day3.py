def max_joltage(batteries: int):
    digits = list(map(int, str(batteries)))
    first_pos, first_digit = max(enumerate(digits[:-1]), key=lambda x: x[1])
    _, second_digit = max(enumerate(digits[first_pos + 1 :]), key=lambda x: x[1])
    return first_digit * 10 + second_digit


if __name__ == "__main__":
    import sys

    print(sum(max_joltage(int(line)) for line in sys.stdin))
