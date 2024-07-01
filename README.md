Symlink the plugin to your docker plugins dir:

```
ln -s docker-devcontainer ~/.docker/cli-plugins/docker-devcontainer
```

```shell
# Build the plugin once:
./scripts/build.sh

# Build the plugin + rebuild on `devcontainer/` changes
./scripts/watch.sh
```
