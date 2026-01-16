# Pull base image which gives all required tools and libraries

FROM python:3.11-slim 

#Set working directory where app code will be store

WORKDIR /app

# Install system dependencies for MySQL
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Copy source code from Host to container

COPY ./app /app

# Run the application
CMD ["python", "main.py"]