# Dotfiles

Dotfiles are managed using a clever `git` alias:

~~~
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
~~~

## New machine installation

* Get the repo set up
 
	~~~
	git clone --separate-git-dir=$HOME/.dotfiles https://github.com/cmerchantz/dotfiles.git ~
	~~~
	
	Or, if there are already some configuration files in place,
	
	~~~
	git clone --separate-git-dir=$HOME/.dotfiles https://github.com/cmerchantz/dotfiles.git tmpdotfiles
	rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
	rm -r tmpdotfiles
	~~~

* Link `~/.itermprefrences` to iTerm in Preferences > General > Preferences.
* Ensure `~/.bash_aliases` is sourced in `.bashrc` or `.bash_profile` or what have you. This is important, since it includes the `dotfiles` alias necessary to maintain the repo.

## Further Reading

This strategy for managing dotfiles is explained in further depth [here](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html) or [here](https://www.atlassian.com/git/tutorials/dotfiles).
