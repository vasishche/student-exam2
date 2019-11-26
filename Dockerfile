FROM python:3.6
HEALTHCHECK CMD pgrep flask || exit 1
ENV FLASK_APP="js_example"
ADD . /app/
WORKDIR /app
RUN pip install -e .
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]

