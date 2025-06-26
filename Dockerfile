FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    g++ \
    wget \
    git \
    curl \
    libgl1 \
    libglib2.0-0 \
    libxext6 \
    libxrender-dev \
    libsm6 \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the application
COPY . .

# Run your FastAPI app (adjust if your entrypoint is different)
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
