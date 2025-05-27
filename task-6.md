flowchart LR
    A[Git Commit] --> B[Build]
    B --> C[Test]
    C --> D[Deploy]
    
    A -->|Push to repo| B
    B -->|Build success| C
    C -->|Tests pass| D
    
    style A fill:#90EE90
    style B fill:#87CEEB
    style C fill:#FFB6C1
    style D fill:#DDA0DD

    ![image](https://github.com/user-attachments/assets/1ea8aab2-c606-41a0-97f0-4bacde8ce236)
