FROM python:3-slim-buster

WORKDIR /code

RUN apt-get update -y \
    && apt-get install unzip nano curl wget -y --no-install-recommends apt-utils

# nano syntax
RUN curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# python env and packages
ADD . /code
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -U pip && pip install -r requirements.txt

CMD ["bash"]
