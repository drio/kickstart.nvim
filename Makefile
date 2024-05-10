all:
	@echo "ready"

rebase:
	git pull upstream master && git rebase upstream/master

rsync:
	rsync -a * --progress --exclude=.git ~drio/.config/nvim/
