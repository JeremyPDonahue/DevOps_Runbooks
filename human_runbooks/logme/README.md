# 📝 logme

**logme** is a lightweight shell script for tracking your daily engineering workflow with minimal effort. It supports daily activity logging, todo tracking, question logging, and answering — all stored in organized files under your home directory.

---

## 📦 Installation

1. Copy the `logme` script to your executable path:

```bash
chmod +x logme
sudo mv logme /usr/local/bin/logme
```

## Run From Anywhere
```bash
logme "Updated deployment manifest for staging"
```

## Log Location:
```bash
~/logme/
├── daily/                  # daily-activity-<date>.log
├── questions/              # questions.md, answered.md
├── todo.md
└── done.md
```

## Basic Logging
```bash
logme "Fixed ingress redirect bug"
```

# Todo Management
```bash
logme --todo "Refactor Helm chart for observability"
logme --todo-view                # View todos
logme --todo-done               # Mark item as done
logme --completed-on 5/17/25    # Show completed for a date
logme --completed-between 5/10/25-5/17/25  # Range query
```

## Question Tracking
```bash
logme --q "What triggers a CoreDNS restart?"
logme --qs-view         # View and optionally answer questions
logme --qs-answered     # View all Q&A pairs
```

## Help
```bash
logme --help
```

### 🧠 Why Use This?
- Keep context as you work
- Build a personal knowledge base
- Improve async communication
- Reflect and realign weekly


