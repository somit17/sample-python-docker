# Pull base image which gives all required tools and libraries

FROM python:3.11-slim 

#Set working directory where app code will be store

WORKDIR /app

#Copy source code from Host to container

COPY ./app /app

# Run the application
CMD ["python", "main.py"]