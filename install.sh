cd "$(dirname "${BASH_SOURCE}")"
if [ -d ~/.oh-my-zsh ]
then
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
	rm -rf ~/.oh-my-zsh
    else
	echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove ~/.oh-my-zsh if you want to install"
	exit
    fi
fi

mkdir ~/.oh-my-zsh
rsync -r --exclude .git . ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# We put /usr/local/bin first so that binaries installed from brew take precedence over
# system binaries.
NEW_PATH=/usr/local/bin:`echo $PATH | sed "s|:*/usr/local/bin||" | sed "s|^:||"`
echo $NEW_PATH
echo "export PATH=$NEW_PATH" >> ~/.zshrc
chsh -s `which zsh`
