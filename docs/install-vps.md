# OpenClaw Custom - VPS Installation Guide

OpenClaw workspace yang sudah dikonfigurasi untuk **Digital Marketing & Pemrograman**.

## Requirements

- VPS dengan Ubuntu 20.04+ / Debian 11+
- Node.js 22+ (recommended) atau 24+
- Git
- SSH access

## Cara Install

### 1. Install Dependencies

```bash
# Update sistem
sudo apt update && sudo apt upgrade -y

# Install Node.js 22
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Install pnpm
npm install -g pnpm

# Install Git (jika belum ada)
sudo apt install -y git
```

### 2. Clone Repository

```bash
# Clone workspace
git clone https://github.com/nurhasanfadillah/openclaw-custom.git ~/openclaw-workspace

# Atau salin folder workspace saja
cp -r ~/openclaw-workspace/workspace ~/.openclaw/workspace
```

### 3. Install OpenClaw (Global)

```bash
# Install OpenClaw CLI
npm install -g openclaw@latest

# Atau dari source
cd openclaw-workspace
pnpm install
pnpm build
```

### 4. Konfigurasi

```bash
# Salin konfigurasi
mkdir -p ~/.openclaw
cp workspace/openclaw.json ~/.openclaw/openclaw.json

# Edit konfigurasi dengan provider preference
nano ~/.openclaw/openclaw.json
```

Contoh konfigurasi:
```json
{
  "agent": {
    "model": "anthropic/sonnet-4.6",
    "systemPrompt": "workspace/AGENTS.md"
  },
  "agents": {
    "defaults": {
      "workspace": "workspace",
      "model": "anthropic/sonnet-4.6"
    }
  }
}
```

### 5. Setup Channel (Opsional)

```bash
# Telegram
openclaw channels login --channel telegram

# WhatsApp  
openclaw channels login --channel whatsapp

# Discord
openclaw channels login --channel discord
```

### 6. Jalankan Gateway

```bash
# Mode development
pnpm gateway:watch

# Mode production
openclaw gateway run --port 18789
```

## Running as Service (Systemd)

```bash
# Buat service file
sudo nano /etc/systemd/system/openclaw.service
```

Isi:
```ini
[Unit]
Description=OpenClaw Gateway
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu
ExecStart=/usr/local/bin/openclaw gateway run --port 18789
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Aktifkan:
```bash
sudo systemctl daemon-reload
sudo systemctl enable openclaw
sudo systemctl start openclaw
```

## Troubleshooting

### Port sudah terpakai
```bash
# Cari proses
lsof -i :18789

# Kill proses
kill -9 <PID>
```

### Node version terlalu rendah
```bash
# Check version
node --version

# Update Node.js
npm install -g n
n stable
```

## Support

- Discord: [Join community](https://discord.gg/clawd)
- Docs: [OpenClaw Docs](https://docs.openclaw.ai)