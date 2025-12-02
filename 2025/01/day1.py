def parse(rotation):
    return int(rotation.replace("L", "-").replace("R", "+"))


def rotate(start, rotation):
    return (start + parse(rotation)) % 100


if __name__ == "__main__":
    import sys

    pos = 50
    count = 0
    for line in sys.stdin:
        pos = rotate(pos, line)
        if pos == 0:
            count += 1
    print(count)
