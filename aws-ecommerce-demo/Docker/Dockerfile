FROM python:3.11-slim

WORKDIR /app

COPY Backend/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY Backend/ ./Backend/
COPY Frontend/ ./Frontend/

EXPOSE 5000

CMD ["uvicorn", "Backend.app:app", "--host", "0.0.0.0", "--port", "5000"]
