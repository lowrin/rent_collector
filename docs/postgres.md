docker exec -t stocks_postgres_1 pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

cat your_dump.sql | docker exec -i stocks_postgres_1 psql -U postgres