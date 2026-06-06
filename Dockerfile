# Etap 1: Budowanie aplikacji

FROM alpine:latest AS builder

# Definiowanie argumentu VERSION
ARG VERSION

# Instalacja curl na potrzeby sprawdzenia w Etapie 2 
RUN apk add --no-cache sed

# Ustawienie katalogu roboczego
WORKDIR /build

# Kopiowanie pliku źródłowego aplikacji
COPY index.html .

# Budowanie aplikacji
RUN sed -i "s/VERSION_PLACEHOLDER/${VERSION}/g" index.html


# Etap 2: Serwer HTTP (Stage 2)

FROM nginx:alpine

# Kopiowanie zbudowanej aplikacji z Etapu 1
COPY --from=builder /build/index.html /usr/share/nginx/html/index.html

# Uwzględnienie sprawdzenia poprawności działania (HEALTHCHECK)
# Sprawdzenie co 30s czy serwer odpowiada
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# Informacja o porcie
EXPOSE 80