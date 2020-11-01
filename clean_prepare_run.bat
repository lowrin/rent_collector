:: start "pipenv shell" and run this script inside

del db.sqlite3
python .\src_django\manage.py makemigrations
python .\src_django\manage.py migrate
python .\src_django\manage.py delete_all
python .\src_django\manage.py create_users
python .\src_django\manage.py add_symbols
:: python .\src_django\manage.py create_indices
python .\src_django\manage.py update_fundamentals
python .\src_django\manage.py runserver