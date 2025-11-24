FROM python:3.10-alpine
WORKDIR /app
RUN apk add --no-cache gcc musl-dev libffi-dev
COPY requirements.txt .
RUN pip3 install --target ./package -r requirements.txt
COPY . . 
EXPOSE 5000
CMD ["Gunicorn", "--bind", "0.0.0.0/5000", "app:app"]
