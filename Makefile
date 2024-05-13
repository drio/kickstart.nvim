all:
	@echo "ready"

rebase:
	#git pull --rebase upstream master && git rebase upstream/master
	git pull --rebase upstream master

rsync:
	rsync -a * --progress --exclude=.git ~drio/.config/nvim/
