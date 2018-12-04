FROM matrixds/rbase:v1

COPY entrypoint.sh /entrypoint.sh

# Create and use plumber user
RUN groupadd --gid=1100 plumber && \
    useradd --create-home --uid=1100 --gid=1100 plumber && \
    chown -R plumber:plumber /home/plumber && \
    chmod +x /entrypoint.sh

COPY plumber.R /usr/local/lib/R/site-library/plumber/plumber.R

USER plumber
WORKDIR /home/plumber
EXPOSE 8000

#still need to tweak the entry point script
#ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8000)"]
CMD ["/usr/local/lib/R/site-library/plumber/plumber.R"]