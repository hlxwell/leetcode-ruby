import math
from queue import PriorityQueue as Queue

def kClosest(points, K):
    q = Queue()
    for i in points:
        r = i[0] ** 2 + i[-1] ** 2
        q.put((str(i), math.sqrt(r)))
    return list(map(lambda x: x[0], q.queue))

if __name__ == "__main__":
    result = kClosest([[1, 2], [-1, -9], [2, 8]], 1)
    print(result)

