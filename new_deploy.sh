cd
sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
type rbenv


git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -l
rbenv install 2.1.2 --verbose
rbenv global 2.1.2


gem install bundler -v 1.7.4
gem install rails -v 4.0.8 --no-ri --no-rdoc

rbenv rehash

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get install nodejs

sudo apt-get install mysql-server
sudo service mysql restart
cd ~/hadhada
bundle install

RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile

mkdir -p shared/pids shared/sockets shared/log
sudo cp unicorn_hadhada /etc/init.d/unicorn_hadhada

sudo chmod 755 /etc/init.d/unicorn_hadhada
sudo update-rc.d unicorn_hadhada defaults

sudo apt-get install nginx
sudo cp nginx-conf /etc/nginx/sites-available/default

sudo service unicorn_hadhada start
sudo service nginx restart
