FROM n8nio/n8n:latest

EXPOSE 5678

# Variables de entorno
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# Health check simplificado (curl ya viene incluido en n8n)
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD node -e "require('http').get('http://localhost:5678/healthz', (res) => process.exit(res.statusCode === 200 ? 0 : 1))"
