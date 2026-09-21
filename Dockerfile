FROM continuumio/miniconda3

RUN apt-get update \
    && apt-get clean \
    && apt-get update -qqq \
    && apt-get install -y -q graphviz g++ \
    && pip install --upgrade pip

COPY ./requirements.txt /app/
RUN pip install -r /app/requirements.txt

CMD jupyter notebook --port=8888 --no-browser --ip=* --allow-root
