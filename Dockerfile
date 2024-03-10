FROM python:3.9-slim AS test

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt
RUN pip install pytest

RUN pytest

FROM test AS production

EXPOSE 5000

CMD ["python", "app.py"]