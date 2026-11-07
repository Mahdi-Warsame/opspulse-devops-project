FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: Create the production image
FROM python:3.12-slim AS runtime

WORKDIR /app
# Copy installed dependencies from the builder stage
COPY --from=builder /install /usr/local
# Copy application code
COPY app/ ./app/

# Run as non-root user
RUN useradd --create-home appuser
USER appuser

# Document the port used by the application
EXPOSE 8000
# Start the application using Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]