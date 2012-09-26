# HTML5 Boilerplate

This repo contains the html boilerplate, submodules, and build tools that I use for web dev.

# Use

Clone this repo:

	:::bash
	git clone --recursive git@github.com:psyrendust/html5-boilerplate.git;

Then run the `setup.sh` to make this ready for a new project. Make sure to add in the ssh repo url as a parameter to the build script:

	:::bash
	./setup.sh;

Or you can pass in the SSH repo url as a parameter to speed things up:

	:::bash
	./setup.sh [ssh repo url goes here];

This is what's in the setup.sh file:

	:::bash
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

You now have a fresh repo with submodules checked out. If you did not pass your ssh repo url as a parameter when running the setup script, you should now run the following to push your first commit;

	:::bash
	cd /path/to/my/repo
	git remote add origin [your git repo goes here]
	git add .
	git commit -m "initial commit"
	git push origin master

Edit the build.sh file to include any files that you would like to process for deployment.

# Compression for deployment

When you are ready to deploy to your server, please run `./build.sh` from the root of your project folder. This will generate a `publish` folder and run htmlcompressor on the html files and yuicompressor on all of the css and js files that you have defined in the `build.sh` script. Please use the assets in the publish folder when uploading to your server.