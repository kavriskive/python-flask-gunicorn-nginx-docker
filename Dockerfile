FROM continuumio/miniconda3

RUN echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list && \
	apt-get update && \
	apt-get -y --force-yes install nginx supervisor

RUN conda install --yes gunicorn flask

COPY flask_demo .
EXPOSE 80
CMD supervisord -c /supervisord.conf -n
