# n8n on Railway Deployment

This directory contains everything needed to deploy n8n on Railway.

## 🚀 Quick Deploy Steps

### 1. Login to Railway
```bash
railway login
```
This will open your browser for authentication.

### 2. Create New Project
```bash
cd ~/n8n-railway
railway init
```
Select "Empty Project" when prompted.

### 3. Link and Deploy
```bash
railway link
railway up
```

### 4. Add Environment Variables
After deployment, go to your Railway dashboard:
1. Select your n8n service
2. Go to "Variables" tab
3. Click "Raw Editor"
4. Paste the contents of `.env` file
5. Update the `WEBHOOK_URL` and `N8N_HOST` with your Railway domain

### 5. Add Persistent Volume
In Railway dashboard:
1. Select your n8n service
2. Go to "Settings" tab
3. Under "Volumes", click "Add Volume"
4. Mount path: `/home/node/.n8n`
5. Size: 5GB (or more if needed)

### 6. Generate Domain
In Railway dashboard:
1. Select your n8n service
2. Go to "Settings" tab
3. Under "Networking", click "Generate Domain"
4. Copy the domain and update your environment variables

## 📝 Important Notes

- **Encryption Key**: The N8N_ENCRYPTION_KEY has been generated. Keep it safe!
- **Basic Auth**: Change the default username/password in `.env`
- **Domain**: Update WEBHOOK_URL and N8N_HOST after Railway generates your domain
- **Volume**: Essential for persisting workflows and credentials

## 🔐 Security

Current encryption key:
```
230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044
```
**Save this key! You'll need it if you ever need to restore or migrate your n8n instance.**

## 🔄 Migrating from Local n8n

1. Export workflows from local n8n:
   - Go to Settings → Workflow Settings → Download
   
2. Import to Railway n8n:
   - Access your Railway n8n instance
   - Go to Settings → Workflow Settings → Upload

## 📊 Monitoring

Check deployment status:
```bash
railway logs
railway status
```

## 🌐 Access n8n

After deployment:
- URL: `https://your-app.up.railway.app`
- Username: `admin` (or what you set)
- Password: `n8n-railway-2025` (or what you set)

## 💰 Cost Estimate

Based on Railway's pricing:
- Hobby Plan: $5/month base
- Resources: ~$15-30/month for n8n
- Total: ~$20-35/month

## 🔧 Troubleshooting

If n8n doesn't start:
1. Check logs: `railway logs`
2. Verify environment variables are set
3. Ensure volume is mounted at `/home/node/.n8n`
4. Check health endpoint: `https://your-domain.up.railway.app/healthz`

## 🚨 Next Steps After Deployment

1. ✅ Update webhook URLs in your workflows
2. ✅ Configure credentials for external services
3. ✅ Set up backup automation
4. ✅ Test webhook endpoints
5. ✅ Import your existing workflows