# Simple Task API

A RESTful API for task management, built with Node.js, Express, and MongoDB.

---

## Description

Simple Task API allows you to create, read, update, and delete tasks.  
You can filter tasks by status and priority, and the API includes basic user authorization.

---

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/simple-task-api.git
   cd simple-task-api
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Set up environment variables:**  
   Create a `.env` file in the project root with the following (example) content:
   ```
   MONGODB_URI=mongodb://localhost:27017/simpletaskdb
   JWT_SECRET=your_jwt_secret
   PORT=3000
   ```

4. **Start the server:**
   ```bash
   npm start
   ```

---

## Usage

- The API will be available at `http://localhost:3000/`
- Use tools like [Postman](https://www.postman.com/) or [curl](https://curl.se/) to interact with the endpoints.
- Register or log in to obtain a JWT token for authorized requests.

---

## API Endpoints

### **Auth**
- `POST /api/auth/register` — Register a new user
- `POST /api/auth/login` — Log in and receive a JWT token

### **Tasks**
- `GET /api/tasks` — Get all tasks (supports filtering by `status` and `priority`)
- `GET /api/tasks/:id` — Get a single task by ID
- `POST /api/tasks` — Create a new task
- `PUT /api/tasks/:id` — Update a task by ID
- `DELETE /api/tasks/:id` — Delete a task by ID

#### **Filtering Example**
