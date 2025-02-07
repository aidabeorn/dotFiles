#!/usr/bin/env sh

# Check if op command is available
if ! command -v op >/dev/null 2>&1; then
    echo "1Password CLI (op) is not installed. Please install it first."
    exit 1
fi

PERSONAL_EMAIL=""
PERSONAL_NAME=""
WORK_EMAIL=""
WORK_NAME=""

read -p "Enter your personal email: " PERSONAL_EMAIL
read -p "Enter your personal name: " PERSONAL_NAME
read -p "Enter your work email: " WORK_EMAIL
read -p "Enter your work name: " WORK_NAME

# Get your signing key from 1Password
PERSONAL_SIGNING_KEY=$(op read "op://SSH/id_ed25519_private/public key")
WORK_SIGNING_KEY=$(op read "op://WORK/id_ed25519_work/public key")

# Create personal git config
cat > ~/.gitpersonal <<EOF
; vim: ft=gitconfig
[user]
  email = ${PERSONAL_EMAIL}
  name = ${PERSONAL_NAME}
  signingkey = ${PERSONAL_SIGNING_KEY}
[commit]
  gpgsign = true
[tag]
  gpgsign = true
[gpg "ssh"]
  program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
EOF

# Create work git config
cat > ~/.gitwork <<EOF
; vim: ft=gitconfig
[user]
  email = ${WORK_EMAIL}
  name = ${WORK_NAME}
  signingkey = ${WORK_SIGNING_KEY}
[commit]
  gpgsign = true
[tag]
  gpgsign = true
[gpg "ssh"]
  program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
EOF

echo "Git configuration files generated successfully!"


