set shell := ["fish", "-c"]
grokloc_dsn := "postgres://grokloc:grokloc@localhost:5432/app"
root_dsn := "postgres://grokloc_root:grokloc@localhost:5432/app"

default:
	@just --list

initdb:
	# must be run as `sudo just initdb`
	su -l postgres -c "initdb --locale=C.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data --data-checksums"

create-users:
	sudo -u postgres psql --file=./00-create-users.sql

create-databases:
	sudo -u postgres psql --file=./01-create-databases.sql

alter-grants:
	sudo -u postgres psql --dbname="test" --file=./02-alter-grants.sql
	sudo -u postgres psql --dbname="app" --file=./02-alter-grants.sql
	sudo -u postgres psql --dbname="grokloc" --file=./02-alter-grants.sql

apply-schema:
	psql --username="grokloc" --dbname="app" --file=./03-schema.sql

truncate:
	psql --username="grokloc" --dbname="app" --file=./04-truncate-tables.sql

ci: create-users create-databases alter-grants apply-schema

psql:
  psql {{grokloc_dsn}}

root:
  psql {{root_dsn}}
