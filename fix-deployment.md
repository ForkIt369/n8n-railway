# 🔧 Fix Railway Deployment

Your Railway project "BroVerse Agents" exists but needs a service. Follow these steps:

## Option 1: Using Railway Dashboard (Easier)

1. **Open Railway Dashboard**
   - Go to: https://railway.app/dashboard
   - Find project: "BroVerse Agents"

2. **Add a New Service**
   - Click **+ New** button
   - Select **GitHub Repo** or **Empty Service**
   - If Empty Service, then in terminal run:
     ```bash
     cd ~/n8n-railway
     railway link
     railway service  # Select the service you just created
     railway up
     ```

## Option 2: Fix via Terminal

Run these commands in order:

```bash
cd ~/n8n-railway

# First, try to deploy directly to the project
railway up --service n8n

# If that doesn't work, create a new service
railway service create n8n

# Then deploy
railway up
```

## Option 3: Start Fresh (Cleanest)

```bash
cd ~/n8n-railway

# Unlink current project
railway unlink

# Create new project with service
railway init

# When prompted:
# 1. Select "DDV's Projects" workspace
# 2. Choose "Empty Project"
# 3. Give it name: "n8n-production"

# Deploy
railway up
```

## After Successful Deploy

### Add Environment Variables
Go to Railway Dashboard → Your Service → Variables → Raw Editor

Paste this:
```
N8N_PORT=5678
N8N_PROTOCOL=https
NODE_ENV=production
DB_TYPE=sqlite
DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite
N8N_ENCRYPTION_KEY=230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044
GENERIC_TIMEZONE=Europe/Berlin
EXECUTIONS_MODE=regular
EXECUTIONS_PROCESS=main
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=n8n-railway-2025
N8N_PAYLOAD_SIZE_MAX=16
VUE_APP_MAX_PINNED_DATA_SIZE=16384
N8N_LOG_LEVEL=info
N8N_LOG_OUTPUT=console
N8N_DIAGNOSTICS_ENABLED=false
```

### Add Volume
Settings → Volumes → Mount at `/home/node/.n8n`

### Generate Domain
Settings → Networking → Generate Domain

Then update these variables with your actual domain:
```
WEBHOOK_URL=https://your-domain.up.railway.app
N8N_HOST=your-domain.up.railway.app
N8N_EDITOR_BASE_URL=https://your-domain.up.railway.app
```

## Verify Deployment
```bash
railway logs
railway open  # Opens dashboard
```

## Common Issues

### "Deploy failed" Error
This usually means:
- No service is linked to the project
- Docker build failed (check logs)
- Missing environment variables

### "Service unavailable" Messages
These are normal during n8n startup - it's just the health check retrying.

### Still Having Issues?
1. Check logs: `railway logs`
2. Check build logs in Railway dashboard
3. Ensure Dockerfile is correct
4. Verify you're in the right directory: `~/n8n-railway`

## Your Encryption Key (Save This!)
```
230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044
```