cd ~ && git clone git@github.com:Qaissaif/hjkkdda.git hadhada
sudo apt-get install mysql-server
sudo service mysql restart
bundle install

RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile

mkdir -p shared/pids shared/sockets shared/log
cp /unicorn_hadhada && /etc/init.d/unicorn_hadhada

chmod 755 /etc/init.d/unicorn_hadhada
sudo update-rc.d unicorn_hadhada defaults

sudo apt-get install nginx
sudo cp /nginx-conf /etc/nginx/sites-available/default

sudo service unicorn_hadhada start
sudo service nginx restart
