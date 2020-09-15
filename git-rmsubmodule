#!/bin/sh
# Based on these instructions https://gist.github.com/myusuf3/7f645819ded92bda6677


# To remove a submodule you need to:

    # Delete the relevant section from the .gitmodules file. (/)
    # Stage the .gitmodules changes git add .gitmodules (/)
    # Delete the relevant section from .git/config.
    # Run git rm --cached path_to_submodule (no trailing slash).
    # Run rm -rf .git/modules/path_to_submodule (no trailing slash).
    # Commit git commit -m "Removed submodule "
    # Delete the now untracked submodule files rm -rf path_to_submodule

# Note: if the submodule is in a subdirectory, the name if this submodule becomes "dirname\/modulename"
# Further Note: This can be fixed. In order to fix it, I'd need to just add a possibility of a directory infromt o the module name, when searching for a module. This however could cause false matches, and tehrefore false deletions

MODULE=$1

deleteModule() {
    sed -i "/\[submodule \"$MODULE\"\]/,+2d" "$1"
}

if grep -qE "\[submodule \"$MODULE\"\]" .gitmodules; then
   deleteModule ".gitmodules"
else
    echo "Module \"$MODULE\" not found"
    exit 1
fi

git add .gitmodules
cd .git/ || exit 1
deleteModule "config"
cd ../
git rm --cached ./"$(echo "$MODULE" | sed 's/\\//')"
rm -rf .git/modules/"$(echo "$MODULE" | sed 's/\\//')"
git commit -m "Removed submodule $(echo "$MODULE" | sed 's/\\//')"
rm -rf ./"$(echo "$MODULE" | sed 's/\\//')"
