FROM asmith
RUN apt-get update && apt-get install -y curl

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git libgtk2.0-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
#     /bin/bash ~/miniconda.sh -b -p /opt/conda && \
#     rm ~/miniconda.sh && \
#     /opt/conda/bin/conda clean -tipsy && \
#     ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
#     echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
#     echo "conda activate base" >> ~/.bashrc

CMD [ "/bin/bash" ]

# RUN conda update -n base -c defaults conda

# RUN conda install pandas numexpr matplotlib scipy seaborn scikit-learn \
# 				 scikit-image sympy cython patsy cloudpickle dill numba \
# 				 bokeh sqlalchemy hdf5 plotly beautifulsoup4 \
# 				 protobuf xlrd ipywidgets tensorflow keras

# RUN conda install -c conda-forge statsmodels  

# RUN conda install python=3

RUN pip3 install pandas numpy opencv-python keras tensorflow scikit-learn \
    scikit-image imutils fpdf psycopg2-binary datetime openpyxl
