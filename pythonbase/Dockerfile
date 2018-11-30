FROM dockerpratik/asmith:v1
RUN apt-get update && apt-get install -y curl

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]


RUN conda install pandas
RUN conda install numexpr 
RUN conda install matplotlib
RUN conda install scipy
RUN conda install seaborn
RUN conda install scikit-learn
RUN conda install scikit-image
RUN conda install sympy
RUN conda install cython
RUN conda install patsy
RUN conda install -c conda-forge statsmodels  
RUN conda install cloudpickle
RUN conda install dill
RUN conda install numba
RUN conda install bokeh
RUN conda install sqlalchemy
RUN conda install hdf5
RUN conda install vincent
RUN conda install beautifulsoup4
RUN conda install protobuf
RUN conda install xlrd
RUN conda install ipywidgets
RUN conda install tensorflow  
RUN pip3 install facets   

RUN apt-get remove -y python
RUN rm /usr/bin/python
RUN ln -s /opt/conda/bin/python /usr/bin/python
