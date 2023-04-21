# dockersetup

- the root will be mounted into your webserver
- database will be initialized with sql scripts in `./mysql`
- shell access to the php instance via `make shell`
- mysql shell access to the database via `make db`


the setup is started via `docker-compose up` and does not require additional configuration. to shutdown and reinitialize the database, its required that you run `docker-compose down -v` to remove all volumes. with the next start, the database will be reinitialized
