# 🚀 Deploy n8n to Railway - Step by Step

## Current Situation
✅ Railway project "BroVerse Agents" exists
❌ No service attached yet

## Step 1: Create Service in Railway Dashboard

### Go to Railway Dashboard:
1. Open: https://railway.app/dashboard
2. Click on **"BroVerse Agents"** project

### Add New Service:
1. Click the **+ New** button
2. Select **"Empty Service"**
3. A new service box will appear

## Step 2: Deploy from Terminal

```bash
cd ~/n8n-railway
railway link        # Select "BroVerse Agents" project
railway service     # Select the service you just created
railway up          # This will deploy n8n
```

## Step 3: Configure in Dashboard

After deployment completes, in Railway Dashboard:

### 3.1 Add Environment Variables
1. Click on your service
2. Go to **Variables** tab
3. Click **Raw Editor**
4. Paste ALL of this:

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
PORT=5678
```

5. Click **Save**

### 3.2 Add Persistent Storage
1. Go to **Settings** tab
2. Scroll to **Volumes**
3. Click **Mount Volume**
4. Set mount path: `/home/node/.n8n`
5. Click **Mount**

### 3.3 Generate Public URL
1. Still in **Settings** tab
2. Scroll to **Networking**
3. Click **Generate Domain**
4. Copy your domain (like: `broverse-agents-production-xxx.up.railway.app`)

### 3.4 Update Domain Variables
1. Go back to **Variables** tab
2. Update these three (replace with YOUR domain):

```
WEBHOOK_URL=https://YOUR-DOMAIN.up.railway.app
N8N_HOST=YOUR-DOMAIN.up.railway.app
N8N_EDITOR_BASE_URL=https://YOUR-DOMAIN.up.railway.app
```

3. Click **Save**
4. Service will auto-redeploy

## Step 4: Access Your n8n

After ~2-3 minutes:
1. Go to: `https://YOUR-DOMAIN.up.railway.app`
2. Login with:
   - Username: `admin`
   - Password: `n8n-railway-2025`

## Troubleshooting

### Check deployment status:
```bash
railway logs
```

### If deployment fails:
1. Check logs in Railway dashboard
2. Verify all environment variables are set
3. Make sure volume is mounted
4. Ensure domain is generated

## 🔐 SAVE THIS - Your Encryption Key:
```
230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044
```

You'll need this if you ever migrate or restore your n8n instance!

---

## Alternative: Start Fresh

If the above doesn't work, start over:

```bash
cd ~/n8n-railway
railway unlink
railway init      # Create new project
railway up        # Deploy
```

Then follow steps 3.1 to 3.4 above.