Here's a basic ASCII art diagram showing the typical three-tier architecture with a client, application server, and database:

```
                                        
  [Client]                 [App Server]              [Database]
   ┌─────┐                  ┌─────────┐               ┌─────┐
   │     │    HTTP/HTTPS    │         │     SQL       │     │
   │  🌐 │ ───────────────> │   ⚙️    │ ────────────> │  💾 │
   │     │ <─────────────── │         │ <──────────── │     │
   └─────┘                  └─────────┘               └─────┘
   Browser                  Node.js/Express           PostgreSQL
                                                     
```

Key components:
- Left: Client/Browser making HTTP requests
- Middle: Application server processing requests
- Right: Database storing data
- Arrows show request/response flow between components

This represents a typical web application setup where:
1. Client makes requests to the app server
2. App server processes requests and interacts with database
3. Data flows back through app server to client

Here's the enhanced ASCII art diagram with labeled components and data flow directions:

```
                    HTTP/HTTPS                   SQL/TCP
                    Requests                  Connections
                  ───────────►              ────────────►
 ┌─────────┐      JSON Data     ┌──────────┐   Queries    ┌──────────┐
 │ CLIENT  │                    │   APP    │              │ DATABASE │
 │         │ ◄─────────────    │  SERVER  │ ◄────────────│          │
 │  Web    │    Responses      │          │   Results    │ Storage  │
 │ Browser │                   │ Node.js/  │             │ PostgreSQL│
 │   🌐    │                   │ Express ⚙️ │             │    💾    │
 └─────────┘                   └──────────┘             └──────────┘
    Port 80/443                 Port 3000                Port 5432

    Data Flow:
    ───────► Request direction
    ◄─────── Response direction
```

Components:
1. **CLIENT**
   - Web browser making HTTP requests
   - Communicates on ports 80 (HTTP) or 443 (HTTPS)
   - Sends/receives JSON data

2. **APP SERVER**
   - Node.js/Express application
   - Listens on port 3000
   - Processes business logic
   - Handles client requests
   - Manages database connections

3. **DATABASE**
   - PostgreSQL database
   - Listens on port 5432
   - Stores persistent data
   - Handles SQL queries

The arrows show the bidirectional flow of:
- HTTP requests/responses between client and server
- SQL queries/results between server and database
