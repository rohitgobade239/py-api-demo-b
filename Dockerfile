# Step 1: Use Python base image
FROM python:3.11-slim

# Step 2: Create a non-root user
RUN useradd -m appuser

# Step 3: Set working directory
WORKDIR /app

# Step 4: Copy files
COPY . .

# Step 5: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: Change ownership of app directory and switch to non-root user
RUN chown -R appuser /app
USER appuser

# Step 7: Expose port
EXPOSE 5000

# Step 8: Add health check
HEALTHCHECK CMD curl --fail http://localhost:5000/ || exit 1

# Step 9: Run the app
CMD ["python", "app.py"]
