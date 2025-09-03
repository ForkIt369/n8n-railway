#!/bin/bash

echo "🚂 n8n Railway Quick Fix"
echo "========================"
echo ""
echo "Current project: BroVagents"
echo "Issue: No service attached"
echo ""
echo "SOLUTION: You need to create a service in Railway Dashboard first!"
echo ""
echo "📋 Steps:"
echo "1. Open: https://railway.app/dashboard"
echo "2. Click on 'BroVagents' project"
echo "3. Click '+ New' button"
echo "4. Select 'Empty Service'"
echo "5. Then come back here and run:"
echo ""
echo "   cd ~/n8n-railway"
echo "   railway service  # Select the service you created"
echo "   railway up       # Deploy n8n"
echo ""
echo "After deployment succeeds, add these in Railway Dashboard:"
echo ""
echo "ENVIRONMENT VARIABLES (Variables tab → Raw Editor):"
echo "=================================================="
cat << 'EOF'
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
EOF
echo ""
echo "VOLUME (Settings → Volumes):"
echo "Mount path: /home/node/.n8n"
echo ""
echo "DOMAIN (Settings → Networking → Generate Domain)"
echo "Then update these variables with your actual domain:"
echo "  WEBHOOK_URL=https://your-domain.up.railway.app"
echo "  N8N_HOST=your-domain.up.railway.app"
echo "  N8N_EDITOR_BASE_URL=https://your-domain.up.railway.app"
echo ""
echo "🔐 Your Encryption Key (SAVE THIS!):"
echo "230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044"