# Minerva

Very basic MVC framework written in Ruby

## How to run

Clone the repo and install the necessary gems:

```bash
$ git clone https://github.com/aziflaj/minerva
$ bundle install --without production
```

Run the rack server:

```bash
$ bundle exec guard  # Reloads the Rack server when App directory is changed
$ rackup             # Just runs the Rack server, nothing is watched
```

The migrations are ran whenever the server starts, so there's no need to manually run anything.
