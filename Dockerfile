FROM n8nio/n8n:latest

# Exponer puerto
EXPOSE 5678

# Variables de entorno
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# Instalar dependencias para health check
USER root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
USER node

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# Comando por defecto
CMD ["n8n", "start"]
