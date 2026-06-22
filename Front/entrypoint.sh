#!/bin/sh
cat > /usr/share/nginx/html/config.js << EOF
window.BACKEND_USERS_URL = "${BACKEND_USERS_URL:-http://localhost:8081}";
window.BACKEND_PRODUCTS_URL = "${BACKEND_PRODUCTS_URL:-http://localhost:8082}";
EOF
nginx -g "daemon off;"