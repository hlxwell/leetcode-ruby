def counter(arr):
    result = (0,0)
    count_cache = {}

    for num in arr:
        count_cache[num] = count_cache.get(num) or 0
        count_cache[num] += 1

    for (k, v) in count_cache.items():
        if v > result[1]:
            result = (k,v)

    return result

print(counter([1,2,3,1,2,3,1,1,1,2,3]))
