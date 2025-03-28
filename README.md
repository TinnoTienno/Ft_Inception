Docker tutorial - Notes

What is docker ?
	docker uses containers to run app in isolation on a computer
	The goal is to be able to work woth more than one person quickly, no "It doesnt work on my pc"
	Everything works the same way everywhere
	Less setup too if we are working on different parallel projects (In isolation)
	predictable  consistent and isolated environnement
	we only need docker

VS VM ?
	sometimes containers are better
	each container uses the same kernel, so lighter, less memory use

// skipped the installation video

images are blueprints for containers, its stores data like :
	runtime environnement
	application code
	dependencies
	extra configurations
	commands

we build the image then run the container
so we can share the image to our peers to share our setup
it would then run the same way on every computer

images are made of several layers
parent image -> describes the OS and runtime environnement of the container
source code
dependencies

DockerHub : online repositery of images
	we can use them as first layer images
		each image on Dockerhub got multiple tags, so we can use our container on any distribution
		always specify the tag so it desnt change over time
		we can pull an image, careful if no version is specified



