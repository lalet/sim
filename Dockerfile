FROM mesosphere/spark:2.0.0-2.2.0-1-hadoop-2.6

RUN apt-get -y install docker.io \
    python-setuptools && \
    easy_install pip 



RUN pip install boutiques pytest pyspark pybids

RUN echo "if [ -e /var/run/docker.sock ]; then sudo chown circleci:circleci /var/run/docker.sock; fi" >> /home/circleci/.bashrc

ENTRYPOINT ["pytest"]
