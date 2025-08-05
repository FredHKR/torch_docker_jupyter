Below is the workflow for creating new versions of dockerfiles and push them to docker hub.

build the image:

docker build -t torch_docker_jupyter:v8 .


retag the image:

docker tag torch_docker_jupyter:v7 fredfrisk/torch-jupyter:v8


versionNumber is the next version you want to create.

docker push fredfrisk/torch-jupyter:v7
