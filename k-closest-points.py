import math

def kClosest(points, K):
    cache = {}
    for i in points:
        r = i[0] ** 2 + i[-1] ** 2
        cache[str(i)] = math.sqrt(r)
    return sorted(cache, key=lambda item: item)

result = kClosest([[1,2], [-1,-9], [2, 8]], 1)
print(result)

# O(n) * O(1)
# O(n*log(n))
