# cherryvis-docker
Runs CherryVis in Docker

## Usage

1. `git clone https://github.com/bmnielsen/cherryvis-docker`
2. `cd cherryvis-docker`
3. `docker build -t cvis .`
4. `docker run -p 8770:8770 -v <path to your replays>:/my-replays -it cvis`
5. Once the server has started up, open `localhost:8770` in a browser.
