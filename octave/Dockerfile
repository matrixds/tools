FROM matrixds/asmith:v2

RUN apt-get -y update
RUN pip install --upgrade pip
RUN pip install octave_kernel
RUN apt-get install -y octave

ENTRYPOINT ["octave"]
