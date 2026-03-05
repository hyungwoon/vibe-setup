#!/bin/zsh

echo "======================================"
echo "  바이브 코딩 환경 설치 스크립트"
echo "  Warp · OpenCode · Claude Code"
echo "  Git · GitHub CLI · Vercel"
echo "  Node · Bun · pnpm · Supabase · Docker · uv"
echo "======================================"
echo ""

# ── 0. Homebrew ──────────────────────────
if ! command -v brew &>/dev/null; then
  echo "📦 Homebrew 설치 중..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)" 2>/dev/null
else
  echo "✅ Homebrew"
fi

# ── 1. Warp ──────────────────────────────
echo "\n🖥️  Warp 설치 중..."
if brew list --cask warp &>/dev/null 2>&1; then
  echo "✅ Warp (이미 설치됨)"
else
  brew install --cask warp && echo "✅ Warp" || echo "❌ Warp 설치 실패"
fi

# ── 2. OpenCode ──────────────────────────
echo "\n🤖 OpenCode 설치 중..."
if command -v opencode &>/dev/null; then
  echo "✅ OpenCode (이미 설치됨)"
else
  curl -fsSL https://opencode.ai/install | bash && echo "✅ OpenCode" || echo "❌ OpenCode 설치 실패"
fi

# ── 3. Git ───────────────────────────────
echo "\n🌿 Git 설치 중..."
if command -v git &>/dev/null; then
  echo "✅ Git $(git --version | awk '{print $3}') (이미 설치됨)"
else
  brew install git && echo "✅ Git" || echo "❌ Git 설치 실패"
fi

# ── 4. GitHub CLI ────────────────────────
echo "\n🐙 GitHub CLI 설치 중..."
if command -v gh &>/dev/null; then
  echo "✅ GitHub CLI (이미 설치됨)"
else
  brew install gh && echo "✅ GitHub CLI" || echo "❌ GitHub CLI 설치 실패"
fi

# ── 5. fnm + Node.js LTS ─────────────────
echo "\n📦 fnm (Node 버전 매니저) 설치 중..."
if command -v fnm &>/dev/null; then
  echo "✅ fnm (이미 설치됨)"
else
  brew install fnm && echo "✅ fnm" || echo "❌ fnm 설치 실패"
fi

if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)" 2>/dev/null
  echo "\n🟢 Node.js LTS 설치 중..."
  fnm install --lts --silent 2>/dev/null && fnm use lts-latest 2>/dev/null \
    && echo "✅ Node.js $(node -v)" \
    || echo "⚠️  Node.js 설치 건너뜀 (이미 있을 수 있음)"
fi

# ── 6. Bun ───────────────────────────────
echo "\n🐇 Bun 설치 중..."
if command -v bun &>/dev/null; then
  echo "✅ Bun $(bun --version) (이미 설치됨)"
else
  curl -fsSL https://bun.sh/install | bash && echo "✅ Bun" || echo "❌ Bun 설치 실패"
fi

# ── 7. pnpm ──────────────────────────────
echo "\n📦 pnpm 설치 중..."
if command -v pnpm &>/dev/null; then
  echo "✅ pnpm (이미 설치됨)"
else
  brew install pnpm && echo "✅ pnpm" || echo "❌ pnpm 설치 실패"
fi

# ── 8. Claude Code ───────────────────────
echo "\n🧠 Claude Code 설치 중..."
if command -v claude &>/dev/null; then
  echo "✅ Claude Code (이미 설치됨)"
else
  if command -v npm &>/dev/null; then
    npm install -g @anthropic-ai/claude-code && echo "✅ Claude Code" || echo "❌ Claude Code 설치 실패"
  else
    echo "⚠️  npm 없음 — Node.js 설치 후 재시도하세요"
  fi
fi

# ── 9. Vercel CLI ─────────────────────────
echo "\n▲ Vercel CLI 설치 중..."
if command -v vercel &>/dev/null; then
  echo "✅ Vercel CLI (이미 설치됨)"
else
  if command -v npm &>/dev/null; then
    npm install -g vercel && echo "✅ Vercel CLI" || echo "❌ Vercel CLI 설치 실패"
  else
    echo "⚠️  npm 없음 — Node.js 설치 후 재시도하세요"
  fi
fi

# ── 10. Supabase CLI ──────────────────────
echo "\n⚡ Supabase CLI 설치 중..."
if command -v supabase &>/dev/null; then
  echo "✅ Supabase CLI (이미 설치됨)"
else
  brew install supabase/tap/supabase && echo "✅ Supabase CLI" || echo "❌ Supabase CLI 설치 실패"
fi

# ── 11. Docker ────────────────────────────
echo "\n🐳 Docker 설치 중..."
if brew list --cask docker &>/dev/null 2>&1; then
  echo "✅ Docker (이미 설치됨)"
else
  brew install --cask docker && echo "✅ Docker" || echo "❌ Docker 설치 실패"
fi

# ── 12. uv (Python 패키지 매니저) ─────────
echo "\n🐍 uv 설치 중..."
if command -v uv &>/dev/null; then
  echo "✅ uv (이미 설치됨)"
else
  curl -LsSf https://astral.sh/uv/install.sh | sh && echo "✅ uv" || echo "❌ uv 설치 실패"
fi

echo ""
echo "======================================"
echo "  설치 완료! 🎉"
echo "======================================"
echo ""
echo "▶ Warp          : Launchpad에서 실행"
echo "▶ OpenCode      : 'opencode' 입력"
echo "▶ Claude Code   : 'claude' 입력"
echo "▶ Vercel        : 'vercel login' 으로 로그인"
echo "▶ GitHub CLI    : 'gh auth login' 으로 로그인"
echo "▶ Supabase CLI  : 'supabase login' 으로 로그인"
echo "▶ Docker        : Launchpad에서 먼저 실행 후 사용"
echo "▶ Node.js       : 새 터미널에서 'node -v' 확인"
echo ""
echo "💡 새 터미널을 열면 모든 PATH가 적용됩니다."
echo ""
