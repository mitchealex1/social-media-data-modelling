ARG python_image_version=3.10

FROM python:${python_image_version}

ARG poetry_version=1.2.0

ENV POETRY_VERSION="${poetry_version}" \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE="false"
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python3 - 

WORKDIR /usr/social_media_data_modelling
COPY . .
RUN poetry install

ENTRYPOINT [ "poetry", "run", "dbt"]
CMD ["--help"]