# Use Python 3.10
FROM python:3.10-slim

# Install system dependencies for OpenCV and audio
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libgl1-mesa-glx \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8080"]
