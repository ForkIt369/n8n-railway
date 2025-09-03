FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache curl
USER node

EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=30s --start-period=120s --retries=5 \
  CMD curl -f http://localhost:5678/healthz || exit 1