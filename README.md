# Janus Configuration

A base Rakefile and directory structure to keep [Janus distrobution's](https://github.com/carlhuda/janus) config files in
sync between installations. 

## Installation


### First System Installation

To install the Rakefile to the system run the following: `curl -Lo- "http://bit.ly/jcs-bootstrap" | bash`

Once you've installed the Rakefile you need to copy the config files and
set up a git repository. You can do that by running the following:

    cd ~/.janus/
    rake install_create

You will need to specify a Git repository URL which will be used to
sychronize your config files and plugins. I also recommend installing
plugins as submodules so that you can stay up to date.

### Additional System Installations

Once you have already configured a git repository you can create an
installation and autolink your vimrc files by running the following

    git clone <repo> ~/.janus
    cd ~/.janus
    rake install_copy


## Updating (Resychronizing)

After you have run either `rake install_copy` or `rake install_create`,
you can run `rake update` to pull the latest config files from your
repository as well as update any plugins.

## Pushing changes

Standard git for pushing changes, simply run `git add .; git commit -m "comment"; git push`,
You can then run `rake update` from another system and have it update
everything for you.
