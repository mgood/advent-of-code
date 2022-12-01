import heapq

def scores(lines):
  curr = 0
  for line in fp:
    line = line.strip()
    if line:
      curr += int(line)
    else:
      yield curr
      curr = 0

with open('input.txt') as fp:
  best = heapq.nlargest(3, scores(fp))
print(sum(best))
