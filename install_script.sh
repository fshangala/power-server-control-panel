# Installation requirements
# - git
# - python3

# download the control panel
echo "\n\nDownloading the control panel...\n"
cd /
git clone https://github.com/fshangala/power-server-control-panel.git
cd /power-server-control-panel

# create a virtual environment
echo "\n\n Creating and activating a virtual environment\n"
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
cp .env-production .env

# run migrations and create a default superuser
echo "\n\nRunning migrations and creating a super user\n"
python manage.py migrate
python manage.py createsuperuser --no-input

# install the service
echo "\n\nInstalling and running the service\n"
cp ./power-server-cp.service /etc/systemd/system/power-server-cp.service
sudo systemctl start power-server-cp.service
sudo systemctl enable power-server-cp.service
