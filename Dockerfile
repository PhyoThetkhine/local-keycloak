FROM quay.io/keycloak/keycloak:26.2.4

ENV KC_DB=postgres \
    KC_DB_URL_HOST=postgres \
    KC_DB_URL_PORT=5432 \
    KC_DB_URL_DATABASE=keycloak \
    KC_DB_USERNAME=keycloak \
    KC_DB_PASSWORD=keycloak \
    KC_HOSTNAME=localhost \
    KC_PROXY=edge

WORKDIR /opt/keycloak

COPY conf/keycloak.conf conf/

CMD ["start-dev"]
