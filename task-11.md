Absolutely! Here’s a complete answer to your request:

---

## 1. What is Jest?

**Jest** is a popular JavaScript testing framework maintained by Meta (Facebook). It allows you to write and run tests for your JavaScript (and TypeScript) code, making it easy to ensure your code works as expected. Jest is simple to set up, provides clear error messages, and includes features like test coverage and mocking.

---

## 2. How to Install Jest

1. **Initialize your Node.js project** (if you haven’t already):

   ```bash
   npm init -y
   ```

2. **Install Jest as a development dependency:**

   ```bash
   npm install --save-dev jest
   ```

---

## 3. Project File Structure

```
your-project/
├── node_modules/
├── package.json
├── sum.js
└── sum.test.js
```

---

## 4. sum.js

```js
function sum(a, b) {
  return a + b;
}

module.exports = sum;
```

---

## 5. sum.test.js

```js
const sum = require('./sum');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});
```

---

## 6. Update package.json to use Jest

Add this to your `package.json` under `"scripts"`:

```json
"scripts": {
  "test": "jest"
}
```

---

## 7. How to Run the Test

In your project directory, run:

```bash
npm test
```

Jest will automatically find and run all files ending with `.test.js` or `.spec.js`.

---

## **Summary Table**

| Step                | Command / File         | Purpose                        |
|---------------------|-----------------------|--------------------------------|
| Initialize project  | `npm init -y`         | Create `package.json`          |
| Install Jest        | `npm install --save-dev jest` | Add Jest to project    |
| Write function      | `sum.js`              | Your code                      |
| Write test          | `sum.test.js`         | Your test code                 |
| Add test script     | `package.json`        | Enable `npm test`              |
| Run tests           | `npm test`            | Run all tests                  |

---

Let me know if you need the actual file contents or further explanation!
