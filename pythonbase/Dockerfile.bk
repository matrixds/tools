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


RUN conda install -y pandas
RUN conda install -y numexpr 
RUN conda install -y matplotlib
RUN conda install -y scipy
RUN conda install -y seaborn
RUN conda install -y scikit-learn
RUN conda install -y scikit-image
RUN conda install -y sympy
RUN conda install -y cython
RUN conda install -y patsy
RUN conda install -c conda-forge statsmodels  
RUN conda install -y cloudpickle
RUN conda install -y dill
RUN conda install -y numba
RUN conda install -y bokeh
RUN conda install -y sqlalchemy
RUN conda install -y hdf5
RUN conda install -y vincent
RUN conda install -y beautifulsoup4
RUN conda install -y protobuf
RUN conda install -y xlrd
RUN conda install -y ipywidgets
RUN conda install -y tensorflow  
RUN pip3 install facets   
