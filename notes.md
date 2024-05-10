git pull upstream master && git rebase upstream/master

rsync -a * --progress --exclude=.git ~drio/.config/nvim/
