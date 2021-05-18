# github-tools

A set of shell scripts to help with the use of git

After being placed in a PATH directory these can be called without the hyphen, e.g. git view instead of git-view


### List of Scripts and what they do
* git-create - Is under development, but should allow the user to create a local git repo and link it to a remote (github.com) in one command
* git-ignore - Taks a file or directory name as the first and only argument and adds said file/directory to a .gitignore file in the root directory of the repository.
* git-remind - Prints the dat of the last commit, commit message and which files changed (but no diffs).
* git-rmsubmodule - Is also under construction but when finished will provide a simple way to remove a github submodile.
* git-sync - depending on flags, adds, commits and/or pushes all/some of the files to local/remote repository
* git-toolsconfig - related to git-create, and will most likely get delted soon
* git-view - the most sumple script, it clears the screen and prints git status. I found myself using those two in sequence very often so they can now be invoked by one command

### Installation
```
git clone https://github.com/dk949/git-tools/
cd git-tools
./make install
```
Note: This is the default method and it assumes that $HOME/.local/bin  exists (it will be created if not) and is on PATH. If you wish to install to a different directory change `DESTDIR` and/or `PREFIX` variables in config.mk.
