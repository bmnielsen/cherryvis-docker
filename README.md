# cherryvis-docker
Runs CherryVis in Docker

## Usage

1. `git clone https://github.com/bmnielsen/cherryvis-docker`
2. `cd cherryvis-docker`
3. `docker build -t cvis .`
4. `docker run -p 8770:8770 -it cvis`
5. Once the server has started up, open `localhost:8770` in a browser.

If you want to view more than just the sample replays, mount a volume with your replays when running the container, e.g. `-v <path to your replays>:/my-replays`.
