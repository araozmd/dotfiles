# AWS CodeArtifact Configuration Guide

## 🎯 Problem Solved

You had AWS CodeArtifact configured globally, which was breaking Mason's ability to install tools from public PyPI. This has been fixed by removing the global configuration.

## ✅ Current Status

- **Global pip config**: ✅ Clean (points to public PyPI)
- **Mason tools**: ✅ Can install semgrep and other tools
- **Neovim**: ✅ All tools work properly

## 🏢 Using CodeArtifact in Anecdotario Projects

### Option 1: Per-Project Configuration (Recommended)

In each Anecdotario project, create a `pip.conf` file:

```bash
# In your anecdotario project root
mkdir -p .pip
cat > .pip/pip.conf << EOF
[global]
index-url = https://your-codeartifact-url/simple/
extra-index-url = https://pypi.org/simple/
EOF

# Then install dependencies with
pip install -r requirements.txt --config-file .pip/pip.conf
```

### Option 2: Virtual Environment Configuration

```bash
# In your anecdotario project
python -m venv venv
source venv/bin/activate

# Configure CodeArtifact only for this environment
pip config --site set global.index-url https://your-codeartifact-url/simple/
pip config --site set global.extra-index-url https://pypi.org/simple/

# Install project dependencies
pip install -r requirements.txt
```

### Option 3: AWS CLI Login (Temporary)

For short-term use:

```bash
# Login to CodeArtifact (tokens expire after 12 hours)
aws codeartifact login --tool pip --repository anecdotario-commons --domain anecdotario-871046834194

# This temporarily configures pip globally
# Remember to clean up afterwards:
pip config unset global.index-url
pip config unset global.extra-index-url
```

### Option 4: Environment Variables

```bash
# Set for current session only
export PIP_INDEX_URL="https://your-codeartifact-url/simple/"
export PIP_EXTRA_INDEX_URL="https://pypi.org/simple/"

# Install dependencies
pip install -r requirements.txt
```

## 📋 Best Practices

### ✅ Do This
- Keep CodeArtifact configuration **project-specific**
- Use virtual environments for project isolation
- Include public PyPI as `extra-index-url` for fallback
- Document the setup in project README

### ❌ Avoid This
- Global CodeArtifact configuration
- Hardcoded credentials in config files
- Forgetting to clean up after temporary setups

## 🔧 Verification Commands

### Check Current Configuration
```bash
# Global config (should be empty now)
pip config list

# Project-specific config
pip config list --site
```

### Test Mason Installation
```bash
# In Neovim
:Mason
# Try installing semgrep - should work now!
```

## 📝 Project Setup Script

Create this script in your Anecdotario projects:

```bash
#!/bin/bash
# setup-pip.sh

echo "Setting up pip for Anecdotario project..."

# Create virtual environment
python -m venv venv
source venv/bin/activate

# Login to CodeArtifact
aws codeartifact login --tool pip --repository anecdotario-commons --domain anecdotario-871046834194 --domain-owner 871046834194

# Add public PyPI as fallback
pip config set global.extra-index-url https://pypi.org/simple/

# Install dependencies
pip install -r requirements.txt

echo "Setup complete! Your global pip config remains clean."
```

## 🎯 Summary

- **Global tools**: Use public PyPI (Mason, global Python tools)
- **Anecdotario projects**: Use CodeArtifact per-project
- **Best of both worlds**: No conflicts, everything works!

This approach keeps your Neovim/Mason tools working while allowing Anecdotario projects to use their private repositories.