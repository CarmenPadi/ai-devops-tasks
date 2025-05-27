def find_duplicates(list_of_items):
    duplicates = []
    for i in range(len(list_of_items)):
        for j in range(i+1, len(list_of_items)):
            if list_of_items[i] == list_of_items[j] and list_of_items[i] not in duplicates:
                duplicates.append(list_of_items[i])
    return duplicates.

Yes, your code can be optimized!  
The current implementation has **O(n²)** time complexity because it uses nested loops to compare every pair of items.  
A more efficient approach is to use a dictionary (or `collections.Counter`) to count occurrences, which reduces the time complexity to **O(n)**.

### Optimized Version Using a Dictionary

```python
def find_duplicates(list_of_items):
    counts = {}
    duplicates = []
    for item in list_of_items:
        if item in counts:
            counts[item] += 1
        else:
            counts[item] = 1
    for item, count in counts.items():
        if count > 1:
            duplicates.append(item)
    return duplicates
```

### Even More Pythonic: Using `collections.Counter`

```python
from collections import Counter

def find_duplicates(list_of_items):
    return [item for item, count in Counter(list_of_items).items() if count > 1]
```

**Advantages:**
- Both versions are O(n) time complexity.
- The `Counter` version is concise and idiomatic.

**Summary:**  
Use a dictionary or `Counter` to count occurrences and collect items that appear more than once. This is much faster and more readable than nested loops.
