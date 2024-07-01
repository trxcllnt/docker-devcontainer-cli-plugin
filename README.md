### Setup
Symlink the plugin to your docker plugins dir:

```shell
$ ln -s "$(pwd)/docker-devcontainer" ~/.docker/cli-plugins/docker-devcontainer
```

### Scripts

Build the plugin once:
```shell
$ ./scripts/build.sh
```

Build the plugin + rebuild on `devcontainer/` changes
```shell
$ ./scripts/watch.sh
```

Debug `docker` CLI bash completions:
```shell
$ ./scripts/debug-completions.sh
```

### Testing

Test commands:
```shell
$ docker devcontainer --help
```

Test completions:
```shell
$ docker devcontainer <tab><tab>
```
