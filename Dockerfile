# Python env

FROM python:3.19-slim 

#Set working directory

WORKDIR /app

#Copy current dir contents to container at /app

COPY ./app /app

# Run the script when the container launches
CMD ["python", "main.py"]