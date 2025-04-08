set quiet

[no-cd]
up:
  docker compose up --wait

[no-cd]
down:
  docker compose down

[no-cd]
pull:
  docker compose pull

[no-cd]
[confirm]
down-volumes:
  docker compose down --volumes
