# cherryvis-docker
Runs CherryVis in Docker

## Usage

Build the image as usual, e.g. `docker build -t cvis .`.

The container exposes port 8770, so make sure to map this when running it. You will also need to mount a volume to make your replay files available to the container.

For example, this is the command I use, which mounts the replays directory in my sc-docker data folder:

`docker run -p 8770:8770 -v C:\Users\bmn\AppData\Roaming\scbw\replays:/replays/Locutus -it cvis`

Then open `localhost:8770` in a web browser.
