echo "BUILD START"

# create a virtual environment named 'venv' if it doesn't already exist
python3.9 -m venv venv

# activate the virtual environment
source venv/bin/activate

# install all deps in the venv
pip install -r requirements.txt

python3.9 manage.py collectstatic --noinput
# collect static files using the Python interpreter from venv
python3.9 manage.py makemigrations api --noinput
python3.9 manage.py migrate --noinput

echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'password')" | python manage.py shell

echo "BUILD END"