FROM java:latest 
MAINTAINER Joerg-H. Panzer

# install required tools and clean-up
#RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && apt-get install -y vim sudo wget git texlive-full && apt-get clean autoclean && apt-get autoremove && rm -rf /var/lib/{apt,dpkg,cache,log}
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && apt-get install -y vim sudo wget git && apt-get clean autoclean && apt-get autoremove && rm -rf /var/lib/{apt,dpkg,cache,log}

# building eXist-db develop (stable)
RUN cd /opt &&  git clone https://github.com/eXist-db/exist.git
RUN cd /opt/exist &&  ./build.sh
RUN find /opt/exist/data/ -type d -print0 | xargs -0 --no-run-if-empty chmod 777

ENV EXIST_HOME /opt/exist/
#Volume /opt/exist/
WORKDIR /opt/exist/

RUN mkdir -p /usr/local/share/fonts  
RUN mkdir -p /usr/local/share/fonts/truetype  
RUN cd /tmp  && \
    wget http://downloads.sourceforge.net/project/junicode/junicode/junicode-0-7-8/junicode-0-7-8.zip  && \
    unzip juni*  && \
    cp junicode/fonts/* /usr/local/share/fonts/truetype/  && \
    rm junicode-0-7-8.zip  && \
    sudo fc-cache


RUN useradd -s /bin/nologin exist && chown -R exist:exist /opt
#VOLUME $PWD/data/:/opt/exist/webapp/WEB-INF/data/
USER exist


EXPOSE 8080

# lets start exist...
CMD /opt/exist/bin/startup.sh

