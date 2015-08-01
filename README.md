# Swarm Ethereum
This is the Ethereum Go Client in a container running on Giant Swarm. This project will be expanded soon.

If you just want to run it locally, do a:

```
make run
```

If you want to have this hosted for you, you'll need a Giant Swarm account: https://giantswarm.io/. If you don't have one, it's in private alpha right now, so you need to ask [@kordless](https://twitter.com/kordless) for an invite.

```
make up
swarm status ethereum
```

#### Example with Output
```
$ make up
# lots of stuff happens 
$ swarm status ethereum
App ethereum is up

service  component  image                                        instanceid    created              status
go       geth       registry.giantswarm.io/kord/ethereum:latest  wvyt4oc7z6ku  2015-07-31 05:57:47  up
```

Grab the instance ID from the output of that and do a:

```
swarm exec wvyt4oc7z6ku -- /usr/bin/geth console
```

That should get you in a console.

Here's a screencast:

[![asciicast](https://asciinema.org/a/4aq2ut5i3lv7g95e8m9ew9pay.png)](https://asciinema.org/a/4aq2ut5i3lv7g95e8m9ew9pay)
