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
