### **Time Complexity**

- The function uses two nested loops:
  - The outer loop runs `n` times (`n = arr.length`).
  - The inner loop runs up to `n - i - 1` times for each `i`.
- In total, the number of iterations is roughly `n(n-1)/2`, which is **O(n²)**.

### **Memory Complexity**

- The `pairs` array stores all pairs whose sum equals `targetSum`.
- In the worst case (if every pair matches), the number of pairs is also `O(n²)`.
- So, **space complexity is O(n²)** in the worst case.

---

## **Can it be optimized?**

Yes!  
You can reduce the time complexity to **O(n)** (on average) by using a hash set to track seen numbers:

### **Optimized Version (O(n) time, O(n) space):**

```javascript
function findPairs(arr, targetSum) {
  const seen = new Set();
  const pairs = [];
  for (const num of arr) {
    const complement = targetSum - num;
    if (seen.has(complement)) {
      pairs.push([complement, num]);
    }
    seen.add(num);
  }
  return pairs;
}
```

**Notes:**
- This version finds each unique pair once (order may differ).
- If you want all possible pairs (including duplicates), or to handle multiple occurrences, you may need to use a map to count occurrences.

---

### **Summary Table**

| Version         | Time Complexity | Space Complexity |
|-----------------|----------------|------------------|
| Original (nested loops) | O(n²)         | O(n²)           |
| Optimized (hash set)    | O(n)          | O(n)            |

---

**Conclusion:**  
The original algorithm is O(n²) in both time and space. Using a hash set, you can optimize it to O(n) time and space for finding unique pairs.
