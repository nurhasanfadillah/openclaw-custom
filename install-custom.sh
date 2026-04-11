#!/bin/bash
# OpenClaw Custom Installer - Full Modifikasi
# Auto pull workspace dari custom repo

set -euo pipefail

REPO="nurhasanfadillah/openclaw-custom"
WORKSPACE_DIR="$HOME/.openclaw/workspace"
CONFIG_FILE="$HOME/.openclaw/openclaw.json"

# Colors
BOLD='\033[1m'
ACCENT='\033[38;2;255;77;77m'
SUCCESS='\033[38;2;0;229;204m'
ERROR='\033[38;2;230;57;70m'
NC='\033[0m'

echo -e "${ACCENT}${BOLD}"
echo "=========================================="
echo "  OpenClaw Custom Installer"
echo "  Digital Marketing & Pemrograman"
echo "==========================================${NC}"
echo ""

# ============ Step 1: Install Node.js ============
echo -e "${SUCCESS}[1/5]${NC} Installing Node.js 22..."

if ! command -v node &> /dev/null || [[ $(node -v | cut -d'v' -f1) != "v22" ]]; then
    curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
    sudo apt install -y nodejs
else
    echo "  Node.js 22+ already installed"
fi

echo "  $(node -v)"
echo ""

# ============ Step 2: Install OpenClaw CLI ============
echo -e "${SUCCESS}[2/5]${NC} Installing OpenClaw CLI..."

npm install -g openclaw@latest

openclaw --version
echo ""

# ============ Step 3: Pull Workspace ============
echo -e "${SUCCESS}[3/5]${NC} Pulling custom workspace from GitHub..."

mkdir -p "$WORKSPACE_DIR"

# Clone or pull
if [ -d "/tmp/openclaw-custom/.git" ]; then
    cd /tmp/openclaw-custom
    git pull origin main 2>/dev/null || true
else
    rm -rf /tmp/openclaw-custom
    git clone "https://github.com/$REPO.git" /tmp/openclaw-custom
fi

# Copy workspace files
cp -rf /tmp/openclaw-custom/workspace/* "$WORKSPACE_DIR/"
echo "  Workspace applied to $WORKSPACE_DIR"

rm -rf /tmp/openclaw-custom
echo ""

# ============ Step 4: Create Config ============
echo -e "${SUCCESS}[4/5]${NC} Creating configuration..."

mkdir -p "$HOME/.openclaw"

if [ ! -f "$CONFIG_FILE" ]; then
    cat > "$CONFIG_FILE" << 'EOF'
{
  "gateway": {
    "mode": "local"
  },
  "agents": {
    "defaults": {
      "workspace": "workspace",
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
EOF
    echo "  Config created at $CONFIG_FILE"
else
    echo "  Config already exists - skipping"
fi
echo ""

# ============ Step 5: Summary ============
echo -e "${SUCCESS}[5/5]${NC} Installation complete!"
echo ""
echo "=========================================="
echo "  Next Steps (Manual):"
echo "=========================================="
echo ""
echo "1. Set API Key:"
echo "   echo 'export ANTHROPIC_API_KEY=\"sk-ant-xxx\"' >> ~/.bashrc"
echo "   source ~/.bashrc"
echo ""
echo "2. (Optional) Setup Channel:"
echo "   Edit: nano $CONFIG_FILE"
echo "   Add channel config (Telegram/WhatsApp/Discord)"
echo ""
echo "3. Run Gateway:"
echo "   openclaw gateway run --port 18789 --bind 0.0.0.0"
echo ""
echo "4. Access Control UI:"
echo "   http://localhost:18789"
echo ""
echo "=========================================="
echo ""
echo -e "${SUCCESS}Installation successful!${NC}"
echo ""
echo "Untuk panduan lengkap, lihat:"
echo "https://github.com/nurhasanfadillah/openclaw-custom"
echo ""