
############################################################
# Dockerfile to build DNAscan pipeline
############################################################


FROM ubuntu:latest
MAINTAINER Heather Marriott "heather.marriott@kcl.ac.uk"
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y git
RUN cd $PWD
#RUN git clone https://github.com/hevmarriott/DNAscanv2.git
COPY ./ $PWD
#COPY /gatk/gatk-4.1.9.0/ /DNA-SCAN-V2/gatk/gatk-4.1.9.0
#RUN cd DNA-SCAN-V2
RUN sed -i -e 's/\r$//' scripts/install_dependencies_hg19_docker.sh
RUN ./scripts/install_dependencies_hg19_docker.sh /local $PWD /docker/hg19/annovar/ 

WORKDIR $PWD/

#ENTRYPOINT cat $PWD/DNA-SCAN-V2/docker/welcome_message.txt
