FROM python:3.8.5

# Create a working directory
WORKDIR /poll_site

# Copy django directory to working directory
COPY poll_site /poll_site/

# Install packages from requirements.txt
COPY requirements.txt /tmp/requirements.txt
# hadolint ignore=DL3013
RUN pip3 install --no-cache-dir --trusted-host files.pythonhosted.org --upgrade pip &&\
    pip3 install --no-cache-dir --trusted-host files.pythonhosted.org --r /tmp/requirements.txt

# Expose port 8000
EXPOSE 8000

# Run app at container launch
CMD ["gunicorn", "--bind", ":8000", "--workers", "1", "poll_site.wsgi:application"]

