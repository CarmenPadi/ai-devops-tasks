const tasks = [
  { id: 3, title: "Write docs", status: "completed" },
  { id: 1, title: "Setup project", status: "completed" },
  { id: 2, title: "Implement feature", status: "in progress" }
];

console.log(getCompletedTaskTitles(tasks));
// Output: ["Setup project", "Write docs"]
