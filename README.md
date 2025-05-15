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



Notes pour l'eval : 
Any credentials, API keys, environment variables must be set inside a .env file during the evaluation. In case any credentials, API keys are available in the git repository and outside of the .env file created during the evaluation, the evaluation stop and the mark is 0.
API keys ??????

Attention a bien virer le .env du push final

The evaluated person has to explain to you in simple terms:

    How Docker and docker compose work
		Reponse : 
			En gros, Docker permet de creer des containers et de les agencer. L'idee principal du container, c'est de permettre la virtualization, c-a-d la creation de simulations d'environnement, les containers de docker se differencient des VM au sens ou le hardware lui n'est pas virtualise, on peut neanmoins continuer a simuler l'OS et tous les elements qui permettent a l'environnement de fonctionner.
			Docker va fonctionner en etapes, d'abord avec la creation d'images, chacunes implementees dans un fichier nomme dockerfile : 
				From permet de definir la base d'une image docker
				Run permet de lancer des commandes dans une nouvelle LAYER 
				copy permet de copier des fichier a l'interieur du container
			Le concept d'image revient a l'idee de recette (dont chaque etape serait une de ces fameuses layer) un peu comme un code compile, c'est une idee differente du container qui lui sera bel et bien l'objet dans lequel l'environnement va tourner.

			Docker Compose va etre un outil specifique permettant aux differents environnements crees, aux containers, de communiquer.
				On va ainsi avoir des services (Correspondant a chaque container que l'on souhaite relier)
				Des volumes (Zone de stockage de memoire persistents et partageable entre les differents containers)
				Des networks (Lien direct entre les containers afin qu'ils puissent communiquer)
				Se rajoutent a ca d'autres elements comme les secrets (mais pas utilises dans le projet, Ca sert globalement a partager des informations utiliser pendant la construction des containers mais supprimes en suite afin d'eviter les fuites de donnees)

    The difference between a Docker image used with docker compose and without docker compose
		?????
		Alors, y a pas vraiment de sens a la question. Docker compose va utiliser une compilation d'images, au demeurant, et on le verra dans le code, on peut tout a fait utiliser les images produites avec un dockerfile dans un docker compose
    The benefit of Docker compared to VMs
		En terme d'interet, les containers regroupent plusieurs avantages par rapport a l'utilisation de VM : 
			La Portabilite, on peut utiliser docker sur n'importe quel OS, sur n'importe quelle machine, l'interet est donc de pouvoir travailler a plusieurs sur differentes machines sans avoir des soucis de compatibilite.
			L'efficacite, les containers sont nettement plus legers que les machines virtuelles parce qu'ils n'ont pas a supporter d'OS. Ca veut dire plus de perfomances et moins longues a demarrer
		Par contre, les VM continuent a prouver leurs interets, nottament dans un environnement de production, le fait que les VM soient beaucoup plus isole puisqu'elles possedent leur propre kernel.
    The pertinence of the directory structure required for this project (an example is provided in the subject's PDF file).
		On decoupe chaque image dans un dossier propre afin de rendre le processus de compose aussi clair que possible


Simple setup

    Ensure that NGINX can be accessed by port 443 only. Once done, open the page.
    Ensure that a SSL/TLS certificate is used.
    Ensure that the WordPress website is properly installed and configured (you shouldn't see the WordPress Installation page). 
	
Open https://login.42.fr/ in your browser, where login is the login of the evaluated student. The displayed page must be the configured WordPress website (you shouldn't see the WordPress Installation page).

Ensure that you can add a comment using the available WordPress user.
Sign in with the administrator account to access the Administration dashboard. The Admin username must not include 'admin' or 'Admin' (e.g., admin, administrator, Admin-login, admin-123, and so forth).
From the Administration dashboard, edit a page. Verify on the website that the page has been updated. If any of the above points is not correct, the evaluation process ends now.

The evaluated student must be able to explain you how to login into the database. Verify that the database is not empty. If any of the above points is not correct, the evaluation process ends now.
	docker exec -ti wordpress bash
	- > apt install mariadb-client 
	- > mysql -h mariadb -P 3306 -u wp_user -p
		-> mdp 123
	- > show databases;
	- > use wordpress;
	- > show tables;  