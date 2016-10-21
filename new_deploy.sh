cd
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

git clone https://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rbenv install -v 2.1.2
rbenv global 2.2.2
gem install bundler
gem install rails --version=4.0.8

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
