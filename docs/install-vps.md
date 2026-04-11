# Install OpenClaw Custom di VPS

## Prerequisites

- VPS dengan Ubuntu 20.04+
- Sudo access
- Domain/IP publik

---

## Step 1: Install Node.js

Wajib Node.js 22+:

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

Verifikasi - harus v22+:
```bash
node --version
```

---

## Step 2: Install OpenClaw CLI

```bash
npm install -g openclaw@latest
```

Verifikasi:
```bash
openclaw --version
```

---

## Step 3: Setup API Key

Buat file config:
```bash
mkdir -p ~/.openclaw
nano ~/.openclaw/openclaw.json
```

Isi dengan:
```json
{
  "agents": {
    "defaults": {
      "model": "claude-sonnet-4-6"
    }
  }
}
```

Set environment variable:
```bash
# Untuk Anthropic Claude
export ANTHROPIC_API_KEY="sk-ant-xxx"

# Atau OpenAIGPT
export OPENAI_API_KEY="sk-xxx"
```

Simpan ke .bashrc (permanen):
```bash
echo 'export ANTHROPIC_API_KEY="sk-ant-xxx"' >> ~/.bashrc
source ~/.bashrc
```

---

## Step 4: Setup Workspace (Opsional)

```bash
mkdir -p ~/.openclaw/workspace
git clone https://github.com/nurhasanfadillah/openclaw-custom.git /tmp/oc
cp -r /tmp/oc/workspace/* ~/.openclaw/workspace/
rm -rf /tmp/oc
```

---

## Step 5: Jalankan Gateway

```bash
openclaw gateway run --port 18789 --bind 0.0.0.0
```

Akses di browser: `http://IP-VPS:18789`

---

## Setup Channel ( Contoh Telegram)

1. Buka @BotFather di Telegram
2. Buat bot baru, dapat token
3. Edit config:

```bash
nano ~/.openclaw/openclaw.json
```

Tambah:
```json
{
  "agents": {
    "defaults": {
      "model": "claude-sonnet-4-6"
    }
  },
  "channels": {
    "telegram": {
      "botToken": "YOUR_TOKEN"
    }
  }
}
```

Restart gateway:
```bash
pkill -f openclaw-gateway
openclaw gateway run --port 18789 --bind 0.0.0.0
```

---

## Masalah Umum & Solusi

### Command not found: openclaw
```bash
source ~/.bashrc
# atau cari lokasi
npm root -g
export PATH="$PATH:$(npm root -g)"
```

### Port 18789 sudah digunakan
```bash
lsof -i :18789
kill -9 <PID>
```

### Invalid API Key
```bash
# Cek env var
echo $ANTHROPIC_API_KEY
# Harus mulai dengan sk-ant-
```

### Model tidak ditemukan
Pakai format yang benar:
- `claude-sonnet-4-6`
- `claude-opus-4-5`
- `gpt-5.4`

### Gateway tidak bisa diakses dari luar
Gunakan `--bind 0.0.0.0` bukan `--bind loopback`

---

## Cek Status

```bash
# Cek running
ps aux | grep openclaw

# Tes kesehatan
openclaw status

# Lihat logs
tail -f ~/.openclaw/logs/gateway.log
```

---

## Quotes

-Discord: https://discord.gg/clawd
-Docs Resmi: https://docs.openclaw.ai