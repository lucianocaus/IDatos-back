# MovieTrack

MovieTrack es una aplicación que fusiona la magia del cine y la música, permitiéndote crear playlists personalizadas en Spotify a partir de las icónicas bandas sonoras de tus películas favoritas.


## Tabla de Contenidos

- [Main Characteristics](#main-characteristics)
- [Getting Started](#getting-started)

## Main Characteristics

- Language: Ruby 3.0.0
- Framework: Rails 7.0.4
- Webserver: Puma
- Databases: Postgres & Redis


## Getting Started

- Clonar el repo
- Instalar PostgreSQL si no lo tenés
- Instalar Rails (version especificada en el Gemfile)
- Correr `bundle install` para instalar las gemas de las que el proyecto depende
- Crear un archivo .env y actualizar sus valores del archivo .env con los valores de tu entorno local
- Correr `rails db:create` para crear la base de datos.
- Correr `rails s` para levantar el servidor
- Una vez que el servidor esté corriendo, sera necesario levantar la aplicación de React que se encuentra en otro repositorio. Para ello, seguir las instrucciones del README de dicho repositorio.
