# xmrig build
deleting an existing release is only possible by also deleting the tag from your command line
Ex: git push --delete origin 6.7.1

# Use docker image
```sh
docker run --rm -ti -v $PWD/config.json:/xmrig/config.json:ro ziggyds/xmrig:latest
```