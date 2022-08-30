FROM python:3.11-rc-alpine as base
FROM base as builder

RUN mkdir /install
WORKDIR /install

COPY requirements.txt /requirements.txt
RUN pip install --prefix=/install -r /requirements.txt

FROM base

COPY --from=builder /install /usr/local
COPY src /app

WORKDIR /app

ENTRYPOINT [ "python" ]
CMD [ "sysinfo.py" ]