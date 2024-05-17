all:
	cat Makefile

rebase:
	#git pull --rebase upstream master && git rebase upstream/master
	git pull --rebase upstream master

deploy:
	rsync -a * --delete --progress --exclude=.git ~drio/.config/nvim/

clean/share:
	rm -rf ~/.local/share/nvim

deploy/nuclear: clean/share deploy
