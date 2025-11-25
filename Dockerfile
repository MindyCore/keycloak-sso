# Multi-stage Dockerfile for Keycloak with Mindycore custom theme
FROM quay.io/keycloak/keycloak:26.4.5 as builder

# Build arguments for metadata
ARG BUILDTIME
ARG VERSION
ARG REVISION

# Set environment variables for the build
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

# Build Keycloak optimized for production
RUN /opt/keycloak/bin/kc.sh build

# Production stage
FROM quay.io/keycloak/keycloak:26.4.5

# Build arguments for metadata
ARG BUILDTIME
ARG VERSION  
ARG REVISION

# Add metadata labels
LABEL org.opencontainers.image.created="${BUILDTIME}"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.title="Keycloak with Mindycore Theme"
LABEL org.opencontainers.image.description="Custom Keycloak image with Mindycore branding and theme"
LABEL org.opencontainers.image.vendor="Mindycore"
LABEL org.opencontainers.image.authors="Mindycore Team"
LABEL org.opencontainers.image.url="https://github.com/MindyCore/keycloak-sso"
LABEL org.opencontainers.image.source="https://github.com/MindyCore/keycloak-sso"
LABEL org.opencontainers.image.licenses="MIT"

# Copy the optimized Keycloak build from builder stage
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copy the custom Mindycore theme
COPY themes/mindycore-theme /opt/keycloak/themes/mindycore-theme

# Create keycloak user and set permissions
USER 0
RUN chown -R 1000:1000 /opt/keycloak/themes/mindycore-theme
USER 1000

# Set working directory
WORKDIR /opt/keycloak

# Set environment variables for runtime
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Expose ports
EXPOSE 8080
EXPOSE 8443

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/health/ready || exit 1

# Default entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
