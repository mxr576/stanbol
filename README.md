# Apache Stanbol in Docker
---

Apache Stanbol 0.12 Docker image.

### How to use this image:


Build the image on your local machine:

```sh
git clone https://github.com/mxr576/stanbol.git
cd stanbol
docker build -t mxr576/stanbol .
```

or pull the pre-built image from Dockerhub

```sh
docker pull mxr576/stanbol
```

then start a new container:

```sh
docker run -id -p 8080:8080 --name stanbol -t mxr576/stanbol
```

**Available environment variables:**

 - JAVA_OPTS - Settings for the JAVA run time environment. Default: `-Xmx1g -XX:MaxPermSize=256m` . Which is the recommended settings from the [Stanbol tutorial](https://stanbol.apache.org/docs/trunk/tutorial.html).

### Licence
[MIT](https://tldrlegal.com/license/mit-license)
