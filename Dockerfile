# For more information, please refer to https://aka.ms/vscode-docker-python
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY ./app /app

# Exemplo de como executar algum comando dentro do container na hora de criá-lo
# RUN python -m grpc_tools.protoc -I ../apis --pyi_out=. --python_out=. --grpc_python_out=. $(find ../apis -iname "*.proto") 

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "__main__.py"]
