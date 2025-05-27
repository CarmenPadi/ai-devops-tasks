Certainly! Here’s a JavaScript function that meets all your requirements:

```javascript
function getCompletedTaskTitles(tasks) {
  return tasks
    .filter(task => task.status === "completed")      // Filter completed tasks
    .sort((a, b) => a.id - b.id)                      // Sort by id ascending
    .map(task => task.title);                         // Extract titles
}
```

**Usage example:**
```javascript
const tasks = [
  { id: 3, title: "Write docs", status: "completed" },
  { id: 1, title: "Setup project", status: "completed" },
  { id: 2, title: "Implement feature", status: "in progress" }
];

console.log(getCompletedTaskTitles(tasks));
// Output: ["Setup project", "Write docs"]
```

**How it works:**
1. **filter**: Keeps only tasks with `status` equal to `"completed"`.
2. **sort**: Orders the filtered tasks by their `id` in ascending order.
3. **map**: Returns a new array containing only the `title` of each sorted, completed task.
