# GET /api/users

Retrieves a paginated list of users. Supports optional filtering by user role.

---

## **Query Parameters**

| Name   | Type    | Description                                 | Default | Constraints      |
|--------|---------|---------------------------------------------|---------|------------------|
| page   | integer | Page number                                 | 1       | ≥ 1              |
| limit  | integer | Number of results per page                  | 10      | 1–100            |
| role   | string  | (Optional) Filter users by their role       | —       | e.g. "admin"     |

---

## **Description**

Returns a paginated array of user objects. You can specify the page and limit for pagination, and optionally filter users by their role.

---

## **Sample Request**

---

## **Sample Response**

```json
{
  "page": 2,
  "limit": 5,
  "total": 23,
  "users": [
    {
      "id": "a1b2c3",
      "name": "Alice Smith",
      "email": "alice@example.com",
      "role": "admin",
      "createdAt": "2024-05-01T12:34:56Z"
    },
    {
      "id": "d4e5f6",
      "name": "Bob Johnson",
      "email": "bob@example.com",
      "role": "admin",
      "createdAt": "2024-05-02T09:21:43Z"
    }
    // ... up to 5 users
  ]
}
```

---

## **Notes**

- If `page` or `limit` are not specified, defaults are used.
- The `limit` parameter cannot exceed 100.
- If `role` is not specified, users of all roles are returned.
- The `total` field indicates the total number of users matching the filter.
