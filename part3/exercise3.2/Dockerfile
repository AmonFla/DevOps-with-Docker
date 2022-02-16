FROM  ubuntu

RUN  apt-get update

RUN apt-get install -y git 
 
RUN apt-get install -y curl

WORKDIR /usr/src/app

COPY ./script.sh ./

RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]
