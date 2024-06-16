FROM python:3.10
RUN useradd user
WORKDIR /app/
COPY main.py /app/
COPY requirements.txt /app/
RUN pip install -r requirements.txt
USER user
CMD ["python3" , "/app/main.py"]
