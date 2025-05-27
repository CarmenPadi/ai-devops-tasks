Certainly! Here is a regular expression that validates an IPv4 address (each octet must be 0–255):

```regex
^(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}$
```

**Explanation:**
- `25[0-5]` matches 250–255
- `2[0-4][0-9]` matches 200–249
- `1[0-9]{2}` matches 100–199
- `[1-9]?[0-9]` matches 0–99 (no leading zeros except for 0 itself)
- The pattern is repeated for all four octets, separated by literal dots (`\.`)

**Usage Example in JavaScript:**
```js
const regex = /^(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}$/;

console.log(regex.test("192.168.1.1")); // true
console.log(regex.test("256.100.50.25")); // false
console.log(regex.test("01.2.3.4")); // false (leading zero not allowed)
```

This regex ensures each octet is in the valid range (0–255) and the address is in the correct dotted-decimal format.
