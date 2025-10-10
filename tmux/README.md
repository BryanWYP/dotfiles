# tmux
## update tmux
In ubuntu 20.04, the origin tmux version is 3.0, which need to be updated.

1. using apt to install dependencies, `apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config automake`
2. download the newest version of tmux source code from "https://github.com/tmux/tmux"
3. run the commmand in serial
	1. `sh autogen.sh`
	2. `./configure`
	3. `make -j`
	4. `make install`


