def parse(rotation: str):
    return int(rotation.replace("L", "-").replace("R", "+"))


def rotate(start: int, rotation: str):
    return (start + parse(rotation)) % 100


def count_clicks(start: int, rotation: str):
    # there's a smarter solution using something like end // 100 to get the
    # count, but that was getting tricky with checking for cases like starting
    # at 0, so brute-force seemed like the simpler approach
    rot = parse(rotation)
    inc = 1 if rot > 0 else -1
    pos = start
    clicks = 0
    while rot != 0:
        pos += inc
        pos %= 100
        if pos == 0:
            clicks += 1
        rot -= inc
    return pos, clicks


if __name__ == "__main__":
    import sys

    pos = 50
    count = 0
    for line in sys.stdin:
        pos, clicks = count_clicks(pos, line)
        count += clicks
    print(count)
