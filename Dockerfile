FROM oven/bun

RUN apt-get update;
RUN apt-get install openssh-server curl git awscli -y;

RUN echo "--- Verifying Tool Versions ---";
RUN ssh -V;
RUN curl -V;
RUN git --version;
RUN bash --version;
RUN bun --version;
RUN aws --version;
RUN echo "-------------------------------";
