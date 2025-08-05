 Docker Image: Build & Push Guide for torch-jupyter

Follow these steps to build your Docker image locally and push it to Docker Hub. Note this example is showing my repo and a specific version 
## 1. Build the Image
```bash
docker build -t torch_docker_jupyter:v9 .
```


* `-t torch_docker_jupyter:v9` names the image **torch\_docker\_jupyter** with the tag **v9**
* `.` sends the current directory as the build context

Verify locally:

```bash
docker images
```

---

## 2. Log In to Docker Hub

Authenticate your CLI with:

```bash
docker login
```

You’ll be prompted for your Docker Hub username and password (or access token).

---

## 3. Tag the Image for Your Namespace

Docker Hub repositories live under your username (`fredfrisk`). Retag the image:

```bash
docker tag torch_docker_jupyter:v9 fredfrisk/torch-jupyter:v9
```

* **versionNumber** is the next version you want to create (e.g., `v9`).

---

## 4. Push to Docker Hub

Push your tagged image:

```bash
docker push fredfrisk/torch-jupyter:v9
```

Docker will upload each layer; wait for the progress bars to complete.

---

## 5. Verify on Docker Hub

Open your browser and navigate to:

```
https://hub.docker.com/r/fredfrisk/torch-jupyter/tags
```

You should see the tag(s) you just pushed.

---

## Quick Command Summary

```bash
# 1. Build
docker build -t torch_docker_jupyter:v9 .

# 2. Log in
docker login

# 3. Tag
docker tag torch_docker_jupyter:v9 fredfrisk/torch-jupyter:v9

# 4. Push
docker push fredfrisk/torch-jupyter:v9
```

Now anyone can run:

```bash
docker pull fredfrisk/torch-jupyter:v9
docker run -d -p 8888:8888 fredfrisk/torch-jupyter:v9
```

…and your container will be up and running!
