# github-tools

A set of shell scripts to help with the use of git

After being placed in a PATH directory these can be called without the hyphen, e.g. git view instead of git-view


### List of Scripts and what they do

* `git-view.sh`
    * Clears the screen and shows `git status`
    * Arguments are forwarded to `git status`
* `git-log-q.sh`
    * An alternative to `git log --oneline` with prettier formatting.
    * All arguments are forwarded to `git log`
* `git-remind.sh`
    * Shows a brief summary of the latest changes made to a repository
    * Takes no arguments
* `git-today.sh`
    * Shows commits made today (since 6am). Uses `git log-q` for formatting.
    * Takes no arguments
* `git-get-default.sh`
    * Show the default branch for a remote. Needs to be able to access the
      remote.
    * Takes an optional remote name (defaults to origin)
* `git-open-remote.sh`
    * Opens the remote URL in a browser.
    * Takes optional remote name (defaults to origin)
    * Requires `BROWSER` environment variable to be set.
* `git-nuke.sh`
    * Reset a git repository without reclining. Deletes all untracked files. By
      default uses `git get-default` to checkout default branch. Works
      recursively on all submodules.
    * Takes optional `-n` or `--no-checkout` flag. If set does not checkout
      default branch.
* `git-cat-old.sh`
    * Prints the file at a revision
    * Takes a revision and a file name
    * Example: `git cat-old HEAD~2 main.cpp`. Prints the contents of `main.cpp`
      as it was two commits ago.
* `git-goback.sh`
    * Rolls a file back a number of commits
    * Takes a file name and an optional number of commits (0 by default, i.e.
      return file to HEAD).
    * Example: `git gobacl main.cpp 2`. Return `main.cpp` to the state it was
      two commits ago.
* `git-delref.sh`
    * Deletes the ref. Useful when local and remote refs conflict.
    * Takes a ref
    * Example: `git delref refs/remotes/origin/trunk`. Delete the ref of the
      remote `trunk` branch.
* `git-profile.sh`
    * Sets git config in accordance with a profile file.
    * See `git profile -h` for the full list of options.
    * The profile file contains profile names as sections and pairs of keys and
      values to be set with `git config`. Keys and values are separated by
      a space (the value may contain spaces).
    * Example: `git profile my-profile`. Will set username to `some-username`
      and user email to `some@email.com`. See example profile file below.
```
# profile file
[my-profile]

user.name some-username
user.email some@email.com
```
* `git-ignore.sh`
    * Under construction. See `TODO.md`

### Installation
```
git clone https://github.com/dk949/git-tools/
cd git-tools
make install
```

Note: by default this will install the scripts into `$HOME/.local/bin`, change
`DESTDIR` and `PREFIX` in `config.mk` (or on the command line) to change
installation directory.
