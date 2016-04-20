# exist_docker
eXist Server installation via docker.

## Adaptions ##
* If texlive is required, edit the Dockerfile and change the comments below "install required tools and clean-up"

## Install and run ##
* clone the repo
* cd to_repo_path 
* mkdir data/
* with docker-compose
	* docker-compose build
	* docker-compose up -d
* with docker
	* docker build -t exist .
	* docker run -p 8080:8080 -v $PWD/data/:/opt/exist/webapp/WEB-INF/data/  exist


## Usage ##
* docker ps
* http://docker_host:exist_port_from_previous_output
	* localhost or
	* boot2docker ip 
* Package Manager
	* User: admin
	* Password: 
	* Install: eXist-db Public Application Repository
	* Install: TEI Simple Processing Model or TEI Processing Model Toolbox
	* exit
* eXide
	* Example
		* click the open-Tab -> apps -> tei-simple -> doc -> documentation.xml
		* click the run-Tab 
			* If the run-Tab is disabled, reload the site
		
