# Hercules docker

This creates a container of the newest hercules from source

## To deploy

`docker build --tag "mainframed767/hercules:latest" .`


`docker push mainframed767/hercules:latest`

:warning: to run this container you must use `docker run --cap-add=sys_nice`



