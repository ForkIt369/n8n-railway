#!/bin/bash

# n8n Railway Deployment Script

echo "🚂 n8n Railway Deployment Setup"
echo "================================"

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found. Please install it first:"
    echo "brew install railway"
    exit 1
fi

echo "✅ Railway CLI found"

# Check if logged in
echo ""
echo "📝 Checking Railway login status..."
if ! railway whoami &> /dev/null; then
    echo "Please login to Railway:"
    echo "Running: railway login"
    railway login
    
    if [ $? -ne 0 ]; then
        echo "❌ Login failed. Please try again."
        exit 1
    fi
fi

echo "✅ Logged in to Railway"

# Initialize project if not already done
if [ ! -f ".railway/config.json" ]; then
    echo ""
    echo "🆕 Creating new Railway project..."
    railway init
    
    if [ $? -ne 0 ]; then
        echo "❌ Failed to initialize Railway project"
        exit 1
    fi
    echo "✅ Railway project created"
else
    echo "✅ Railway project already initialized"
fi

# Deploy to Railway
echo ""
echo "🚀 Deploying n8n to Railway..."
echo "This may take a few minutes..."
railway up

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Go to your Railway dashboard: https://railway.app/dashboard"
    echo "2. Select your n8n service"
    echo "3. Go to 'Variables' tab and add environment variables from .env"
    echo "4. Go to 'Settings' → 'Volumes' and add volume at /home/node/.n8n"
    echo "5. Go to 'Settings' → 'Networking' and generate a domain"
    echo "6. Update WEBHOOK_URL and N8N_HOST in variables with your new domain"
    echo ""
    echo "📊 View logs with: railway logs"
    echo "🔄 Redeploy with: railway up"
    echo ""
    echo "💡 Your encryption key (save this!):"
    echo "230bb2ae69266c52189bec7db42a36b6d284a078be9acb35b256c03137434044"
else
    echo "❌ Deployment failed. Check the error messages above."
    exit 1
fi