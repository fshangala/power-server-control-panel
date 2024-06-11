# update system packages
sudo apt update

# check if git is installed
git --version

# install git
sudo apt install git

# check if nginx is installed
nginx -v

# install nginx
sudo apt install nginx

# check if python is installed
python3 --version

# install python
sudo apt install python3

# download the control panel
cd ~/
git clone https://github.com/fshangala/power-server-control-panel.git
cd ~/power-server-control-panel

# create a virtual environment
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
cp .env-production .env

# run migrations and create a default superuser
python manage.py migrate
python manage.py createsuperuser --no-input

# start and enable the service
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

# configure nginx to proxy pass our server then 
sudo ufw delete allow 8000
sudo ufw allow 'Nginx Full'
