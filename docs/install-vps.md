# Install OpenClaw Custom di VPS

## Prerequisites

- VPS dengan Ubuntu 20.04+
- Sudo access

---

## Cara Install (Otomatis)

Jalankan satu perintah ini:

```bash
curl -fsSL https://raw.githubusercontent.com/nurhasanfadillah/openclaw-custom/main/install-custom.sh | bash
```

Selesai! Installer akan:
1. ✅ Install Node.js 22+
2. ✅ Install OpenClaw CLI
3. ✅ Pull custom workspace (Digital Marketing & Pemrograman)
4. ✅ Buat konfigurasi default

---

## Manual Setup (Untuk Customize)

Jika ingin install manual:

```bash
# Step 1: Node.js 22+
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Step 2: OpenClaw CLI
npm install -g openclaw@latest

# Step 3: Workspace + Config
mkdir -p ~/.openclaw/workspace
git clone https://github.com/nurhasanfadillah/openclaw-custom.git /tmp/oc
cp -r /tmp/oc/workspace/* ~/.openclaw/workspace/
rm -rf /tmp/oc
```

---

## Setup API Key (Wajib)

```bash
echo 'export ANTHROPIC_API_KEY="sk-ant-xxx"' >> ~/.bashrc
source ~/.bashrc
```

---

## Setup Channel (Opsional - Manual)

Edit `~/.openclaw/openclaw.json`:

```json
{
  "agents": { "defaults": { "model": "claude-sonnet-4-6" } },
  "channels": {
    "telegram": { "botToken": "YOUR_TOKEN" }
  }
}
```

---

## Jalankan Gateway

```bash
openclaw gateway run --port 18789 --bind 0.0.0.0
```

Akses: `http://IP-VPS:18789`

---

## Masalah Umum

| Masalah | Solusi |
|---------|-------|
| Port terpakai | `kill -9 $(lsof -t -i:18789)` |
| Node tidak found | `source ~/.bashrc` |
| API Key error | Cek: `echo $ANTHROPIC_API_KEY` |