# Sprawozdanie lab5
# Michał Ziętek

Budowanie obrazu z określeniem wersji aplikacji  
Wersja aplikacji przekazywana jest dynamicznie w trakcie budowania za pomocą argumentu --build-arg  
docker build --build-arg VERSION="v1.2.3-final" -t moj-obraz-projekt:1.0 .

Uruchomienie kontenera  
docker run -d -p 8080:80 --name moj-kontener-zadanie moj-obraz-projekt:1.0

Sprawdzenie poprawności działania mechanizmu HEALTHCHECK  
docker ps

Weryfikacja działania (test curl)  
curl http://localhost:8080
