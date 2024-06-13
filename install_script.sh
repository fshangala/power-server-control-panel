# Installation requirements
# - git
# - python3

# download the control panel
cd /
git clone https://github.com/fshangala/power-server-control-panel.git
cd /power-server-control-panel

# create a virtual environment
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
cp .env-production .env

# run migrations and create a default superuser
python manage.py migrate
python manage.py createsuperuser --no-input

# install the service
cp ./power-server-cp.service /etc/systemd/system/power-server-cp.service

# start and enable the service
sudo systemctl start power-server-cp.service
sudo systemctl enable power-server-cp.service

# configure firewall to allow server port
sudo ufw allow 8000
