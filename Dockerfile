FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    postgresql-client \
    gcc \
    && \
    pip install --trusted-host pypi.python.org -r /app/requirements.txt \
    && \
    apt-get purge -y --auto-remove gcc \
    && \
    apt-get clean \
    && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/
COPY ./entrypoint.sh /

# Define the entrypoint script
ENTRYPOINT ["sh", "/entrypoint.sh"]
