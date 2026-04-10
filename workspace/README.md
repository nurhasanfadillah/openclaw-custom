# OpenClaw Custom - Digital Marketing & Pemrograman

Workspace OpenClaw yang sudah dikustomisasi untuk kebutuhan Digital Marketing dan Pemrograman.

## Isi Package

| File | Deskripsi |
|------|----------|
| `AGENTS.md` | Persona: Digital Marketing & Programming assistant |
| `SOUL.md` | Identity dan values |
| `TOOLS.md` | Daftar tools yang tersedia |
| `openclaw.json` | Konfigurasi default |
| `skills/` | Custom skills |

## Skills Tersedia

- `digital-marketing` - Strategy, content, analytics, automation
- `programming` - Development, debugging, code review

## Quick Install

```bash
# Clone repository
git clone https://github.com/nurhasanfadillah/openclaw-custom.git

# Salin workspace
cp -r workspace ~/.openclaw/workspace
```

## VPS Installation

Lihat `../docs/install-vps.md` untuk panduan lengkap installasi VPS.

## Konfigurasi

Edit `~/.openclaw/openclaw.json`:

```json
{
  "agent": {
    "model": "anthropic/sonnet-4.6",
    "systemPrompt": "workspace/AGENTS.md"
  }
}
```

## Usage

```bash
# Run agent
openclaw agent --message "Buat strategi social media"

# Run agent dengan workspace
openclaw agent --message "Tulis fungsi API" --workspace ./workspace
```

## License

MIT