# System Access Configuration

## Enable Full System Access

Edit `~/.openclaw/openclaw.json`:

```json
{
  "gateway": {
    "mode": "local"
  },
  "agents": {
    "defaults": {
      "model": "claude-sonnet-4-6"
    }
  },
  "tools": {
    "allow": [
      "bash",
      "read", 
      "write",
      "edit",
      "glob",
      "grep",
      "websearch",
      "webfetch"
    ]
  },
  "session": {
    "reset": {
      "mode": "daily",
      "atHour": 4
    }
  }
}
```

## Tools Description

| Tool | Description |
|------|------------|
| `bash` | Execute system commands, run scripts, install packages |
| `read` | Read files |
| `write` | Create/write files |
| `edit` | Modify files |
| `glob` | Find files by pattern |
| `grep` | Search file contents |
| `websearch` | Web research |
| `webfetch` | Fetch URL content |

## Security Notes

- Tool `bash` memberikan FULL system access
- Hanya jalankan di trusted environment
- Jangan экспose ke publik tanpa auth

## Verify Access

```bash
# Test bash
openclaw agent --message "Run: echo 'System access OK'"

# Test file ops
openclaw agent --message "Create test file: echo 'test' > /tmp/test.txt"
```