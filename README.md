# rent collector

## running manage commands in dev

- `poetry run task serve`

- `docker-compose -f docker-compose.dev.yml up --build`


## running manage commands in prod

- `docker-compose -f docker-compose.prod.yml up --build -d`

- `docker-compose -f docker-compose.prod.yml down`


## to run migrations or so
- `docker-compose -f docker-compose.prod.yml exec cron bash`

- `docker-compose down`

## run in wsl 2
- `/mnt/c/Users/jonas/git/rent_collector`


## reset

### delete all docker persistant data
- `rm -fr /dockerdata/*`