FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN curl -sL https://ibm.biz/idt-installer | bash
RUN apt-get install cmake g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev sudo systemd -y
RUN git clone https://github.com/tsl0922/ttyd.git
RUN cd ttyd && mkdir build && cd build && cmake .. && make && make install
RUN sudo apt-get install systemd
EXPOSE 7681

CMD ["ttyd", "-p", "7681", "bash"]