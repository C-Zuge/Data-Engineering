FROM apache/airflow:2.4.3-python3.8

USER root

# Airflow
ARG AIRFLOW_USER_HOME=/opt/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}
ENV ACCEPT_EULA=Y

RUN set -ex \
    && buildDeps=' \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        git \
    ' \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install msodbcsql17 -y \
    && apt-get install -y --no-install-recommends \
        $buildDeps \
        freetds-bin \
        build-essential \
        default-libmysqlclient-dev \
        apt-utils \
        vim \
        curl \
        rsync \
        netcat \
    && apt-get purge --auto-remove -y $buildDeps \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

COPY ./airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg

RUN chown -R airflow: ${AIRFLOW_USER_HOME}

USER airflow

COPY ./requirements.txt .

RUN pip install -U pip setuptools wheel &&\
    pip install --upgrade pip
    # pip install --no-cache-dir -r ./requirements.txt