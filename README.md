# yosys container

This provides a container file for *yosys*.
Other containers can import the output by copying the required files.

## Create image

The default tool for building the image is *podman*.
This can be changed to *docker* by setting the environment variable
`CONTAINER_TOOL`.

```console
$ make image
```
