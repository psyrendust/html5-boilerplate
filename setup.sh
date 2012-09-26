#!/bin/bash

# remove this repo's .git config file
rm -rf .git;

# reinitialize this folder as an empty git project
git init;

# add in the submodule HTML5 build tools
git submodule add git@github.com:psyrendust/html5-build-tools.git tools;

# copy over the build script to the root of the project
cp tools/sample-build.sh build.sh;

# cleanup and remove this setup script
rm -rf setup.sh;

#  check to see if a parameter was passed
if [ "$1" == "" ]; then
	echo "You now have a fresh repo with submodules checked out.";
	echo "Now run the following to push your first commit:";
	echo "cd /path/to/my/repo";
	echo "git remote add origin [your git repo goes here]";
	echo "git add .";
	echo "git commit -m \"initial commit\"";
	echo "git push origin master";
else
	# add all files to git
	git add -A;

	# add the remote repo
	git remote add origin $1;

	# add the first commit message
	git commit -m "first commit";

	# push the first commit
	git push origin master;
fi