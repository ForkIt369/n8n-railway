# 🚂 Manual Railway Deployment Steps for n8n

Since Railway CLI requires interactive input, please follow these manual steps:

## Step 1: Open Terminal
```bash
cd ~/n8n-railway
```

## Step 2: Create Railway Project
Run this command and select your workspace when prompted:
```bash
railway init
```
- Select: **DDV's Projects** (or your workspace name)
- Choose: **Empty Project**

## Step 3: Deploy to Railway
```bash
railway up
```
This will upload and build your n8n Docker image.

## Step 4: Configure in Railway Dashboard

### 4.1 Add Environment Variables
1. Open https://railway.app/dashboard
2. Click on your new n8n project
3. Go to **Variables** tab
4. Click **Raw Editor**
5. Copy and paste this:

```env
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

### 4.2 Add Persistent Volume
1. In your service, go to **Settings** tab
2. Scroll to **Volumes** section
3. Click **Mount Volume**
4. Set mount path: `/home/node/.n8n`
5. Click **Deploy**

### 4.3 Generate Public Domain
1. Still in **Settings** tab
2. Scroll to **Networking** section  
3. Click **Generate Domain**
4. Copy your domain (e.g., `n8n-production-xxx.up.railway.app`)

### 4.4 Update Domain Variables
1. Go back to **Variables** tab
2. Add these with your actual domain:
```env
WEBHOOK_URL=https://your-domain.up.railway.app
N8N_HOST=your-domain.up.railway.app
N8N_EDITOR_BASE_URL=https://your-domain.up.railway.app
```

## Step 5: Verify Deployment
Check if n8n is running:
```bash
railway logs
```

## Step 6: Access n8n
1. Open: `https://your-domain.up.railway.app`
2. Login with:
   - Username: `admin`
   - Password: `n8n-railway-2025`

## 🎉 Success!
Your n8n is now running on Railway with:
- ✅ Persistent storage for workflows
- ✅ Fixed webhook URLs
- ✅ 24/7 availability
- ✅ Automatic HTTPS

## 📝 Important Info to Save:

### Encryption Key (CRITICAL - Save this!)
```
230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044
```

### Quick Commands
- View logs: `railway logs`
- Deploy updates: `railway up`
- Open dashboard: `railway open`

## 🔄 Migrate Your Workflows
1. Export from local n8n:
   - Go to http://localhost:5678
   - Settings → Workflows → Download all workflows

2. Import to Railway n8n:
   - Go to your Railway n8n URL
   - Settings → Workflows → Import from file

## 💡 Tips
- Railway will auto-deploy when you push changes
- Monitor usage at https://railway.app/usage
- Set up budget alerts in Railway dashboard
- Your webhook URLs are now permanent!