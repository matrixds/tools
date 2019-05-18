FROM matrixds/asmith:v3

RUN apt-get -y update
RUN pip install --upgrade pip
RUN pip install octave_kernel
RUN apt-get install -y octave

ENTRYPOINT ["octave"]
