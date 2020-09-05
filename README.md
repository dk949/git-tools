# github-tools

A set of shell scripts to help with the use of git

After being placed in a PATH directory these can be called without the hyphen, e.g. git view instead of git-view 


### List of Scripts and what they do
* git-create - Is under development, but should allow the user to create a local git repo and link it to a remote (github.com) in one command
* git-ignore - Taks a file or directory name as the first and only argument and adds said file/directory to a .gitignore file in the root directory of the repository.
* git-rmsubmodule - Is also under construction but when finished will provide a simple way to remove a github submodile.
* git-sync - depending on flags, adds, commits and/or pushes all/some of the files to local/remote repository
* git-toolsconfig - related to git-create, and will most likely get delted soon
* git-view - the most sumple script, it clears the screen and prints git status. I found myself using those two in sequence very often so they can now be invoked by one command

### Installation
```
git clone https://github.com/dk949/git-tools/
cd git-tools
./install
```
Note: This is the default method and it assumes that ~/bin  exists, is on PATH and does not contain files namesd the same as files in this repo (if there are they will be removed). If you wish to install to a different drectory simply change the `cd ~/bin` portion of the install file to your desired directory.
