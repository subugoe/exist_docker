# exist_docker
eXist Server installation via docker.

## Adaptions ##
* If texlive is required, edit the Dockerfile and change the comments below "install required tools and clean-up"

## Install and run ##
* git clone \<repo\>
* docker build -t exist .
* docker run -P -d exist



## Usage ##
* docker ps
* http://<docker_host>:<exist_port_from_previous_output>
	* localhost or
	* boot2docker ip 
* Package Manager
	* User: admin
	* Password: 
	* Install: eXist-db Public Application Repository
	* Install: TEI Simple Processing Model
	* exit
* eXide
	* Example
		* click the open-Tab -> apps -> tei-simple -> doc -> documentation.xml
		* click the run-Tab 
			* If the run-Tab is disabled, close the file and opne it again
		