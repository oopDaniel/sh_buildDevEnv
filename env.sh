#! /bin/bash
# build up the development environment automatically
# -- by Daniel --

echo "Mission start!";
echo "Installing necessary tools...";
add-apt-repository ppa:webupd8team/sublime-text-2;
apt-get update;
apt-get upgrate;
apt-get install -y zsh libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev sublime-text vim git openjdk-7-jdk libgl1-mesa-dev:i386;
curl -L http://install.ohmyz.sh | sh;
ln -s /opt/sublime_text_2/sublime_text /usr/bin/subl;
mv ./lib/.gitconfig ~/.gitconfig;
mv ./lib/.vimrc ~/.vimrc;

apt-get autoremove;
apt-get clean;
echo "Done!";

# For zsh setting
echo "Installing ZSH and setting up...";
mv ./lib/.zshrc ~/.zshrc;
mv ./lib/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme;
echo "Done!";

# For nodeJS
echo "Installing nvm & nodeJS...";
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash;
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -;
apt-get install -y nodejs;
echo "Done!"
echo "Installing necessary tools from npm...";
npm install -g bower grunt-cli jshint gulp napa yo generator-karma generator-angular cordova;
npm update -g;
echo "Done!";

# For RVM & gem
echo "Installing rvm & ruby...";
\curl -sSL https://get.rvm.io | bash;
echo "export PATH=\"$PATH:$HOME/.rvm/bin\"" >> ~/.bashrc;
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc;
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\"" >> ~/.bashrc;
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc;
source ~/.bashrc;
rvm install 2.3.0;
echo "Done!";
echo "Installing Rails and Compass...";
gem install compass rails sass --no-rdoc --no-ri;
echo "Done!";

# For bwc dependent files
echo "Building up the project directory...";
mkdir bwc&&cd $_;
npm install grunt jit-grunt autoprefixer-core phantomjs-prebuilt phantomjs jit-grunt karma jasmine-core grunt-contrib-jshint grunt-contrib-concat grunt-contrib-cssmin grunt-contrib-uglify grunt-contrib-watch grunt-contrib-connect grunt-filerev grunt-usemin grunt-text-replace jshint-stylish time-grunt --save-dev;
echo "Done!";

# For copying fonts
echo "Copying fonts.."
font_dir="$HOME/.local/share/fonts";
mkdir -p $font_dir;
mv monaco.ttf $font_dir;
mv Menlo\ Regular\ for\ Powerline.otf $font_dir;
if command -v fc-cache @>/dev/null ; then
    fc-cache -f $font_dir
fi
echo "Done!";

chsh -s /usr/bin/zsh;
echo "Please install the font manually.";
echo "And you may like to re-log in to see what happened now!!";











wget
rename
export "PATH=$PATH:$HOME/android-sdk/tools"
