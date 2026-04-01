```markdown
# MCP Server Manager (Phase 1)
**Course:** SEP-759 - McMaster University  
**Developer:** Zihe Mai  
**Environment:** Ruby 3.3.6 | Rails 8.1.3 | PostgreSQL (Docker)

## 📌 Project Overview
The **MCP Server Manager** is a centralized hub for managing Model Context Protocol (MCP) integrations. It allows users to connect various AI Clients (like Claude or Cursor) to a catalog of global MCP Servers (Notion, GitHub, etc.), enabling secure data access and tool execution for AI agents.

---

## 🚀 Getting Started

### 1. Prerequisites
Ensure you have the following installed on your MacBook:
* **Ruby 3.3.6**
* **Rails 8.1.3**
* **Docker Desktop** (for the PostgreSQL database)

### 2. Database Setup
This project uses PostgreSQL running in a Docker container.
```bash
# Start the database container
docker-compose up -d

# Setup the database and tables
bin/rails db:prepare

# Seed the database with test users and servers
bin/rails db:seed
```

### 3. Start the Application
```bash
bin/rails server
```
Visit the application at: `http://localhost:3000`

---

## 🔑 Test Credentials
Use these accounts to explore the multi-user functionality and the **N:M (Many-to-Many)** relationships.

| User Role | Email | Password |
| :--- | :--- | :--- |
| **Admin User** | `admin@test.com` | `password123` |
| **Student User** | `student@test.com` | `password123` |

---

## 🛠 Features (Phase 1 Requirements)

### 1. Database & Relationships
The application implements a complex relational structure satisfying the rubric:
* **1:N (One-to-Many):** Users have many AI Clients (e.g., Claude, Cursor).
* **N:M (Many-to-Many):** Users connect to Global MCP Servers through a `Connections` join table.
* **Nested Resources:** Tools are nested under MCP Servers (`/mcp_servers/:id/tools`).

### 2. Authentication
* Custom authentication system using `bcrypt` and `has_secure_password`.
* Secure login/logout flow with session persistence.

### 3. Modern UI/UX
* **Sidebar Navigation:** Dynamic sidebar listing the user's specific clients and active servers.
* **Floating Windows (Modals):** Tool lists and Account Settings open in blurred-backdrop floating windows for a modern "App" feel.
* **Profile Management:** Integrated **Active Storage** for profile photo uploads (Phase 2 Bonus Preview).

---

## 📂 Project Structure Highlights
* `app/models/`: Contains the logic for Users, Clients, McpServers, Tools, and Connections.
* `app/views/shared/_sidebar.html.erb`: A DRY, reusable sidebar component.
* `db/seeds.rb`: Automatically populates the global server catalog (Notion, ChatGPT, Stripe, etc.) and attaches standard tools (`shell`, `read`, `write`, `database`) to each.

---

## 🧪 Phase 2 Roadmap
- [ ] Implement Devise-based JWT Authentication.
- [ ] Create 5+ JSON API Endpoints under `api/v1/`.
- [ ] Configure Action Mailer for connection notifications.
- [ ] Deploy to Heroku with AWS S3 for Active Storage.
```

---

### How to add this to your project:
1.  **Create the file:** `touch README.md`
2.  **Open it:** `open README.md` (or use VS Code).
3.  **Paste the text above.**
4.  **Push to GitHub:**
    ```bash
    git add README.md
    git commit -m "Added professional README for Phase 1 submission"
    git push
    ```

Does this cover everything you wanted for your submission, or should we add a specific section about the **PIRO** project you mentioned earlier?