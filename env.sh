#! /bin/bash
# build up the development environment automatically
# -- by Daniel --

add-apt-repository ppa:webupd8team/sublime-text-2;
apt-get update;
apt-get upgrate;
apt-get install -y zsh libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev sublime-text vim git;
curl -L http://install.ohmyz.sh | sh;
ln -s /opt/sublime_text_2/sublime_text /usr/bin/subl;

apt-get autoremove;
apt-get clean;

# For zsh setting
mv ./lib/.zshrc ~/.zshrc;
mv ./lib/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme;

# For nodeJS
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash;
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -;
apt-get install -y nodejs;
npm install -g bower grunt-cli jshint gulp napa yo generator-karma generator-angular;
npm update -g;

# For RVM & gem
\curl -sSL https://get.rvm.io | bash -s stable;
echo "export PATH=\"$PATH:$HOME/.rvm/bin\"" >> ~/.bashrc;
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc;
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\"" >> ~/.bashrc;
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc;
source ~/.bashrc;
gem install compass rails sass --no-rdoc --no-ri;

# For bwc dependent files
mkdir bwc&&cd $_;
npm install grunt jit-grunt autoprefixer-core phantomjs-prebuilt phantomjs jit-grunt karma jasmine-core grunt-contrib-jshint grunt-contrib-concat grunt-contrib-cssmin grunt-contrib-uglify grunt-contrib-watch grunt-contrib-connect grunt-filerev grunt-usemin jshint-stylish time-grunt --save-dev;

chsh -s /usr/bin/zsh;
