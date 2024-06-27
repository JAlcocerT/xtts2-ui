FROM python:3.10-slim

# Update the package list and install git
RUN apt-get update && \
    apt-get install -y git

# Clone the repository
#RUN git clone https://github.com/BoltzmannEntropy/xtts2-ui.git
RUN git clone https://github.com/JAlcocerT/xtts2-ui

# Set the working directory to the cloned repository
WORKDIR /xtts2-ui

# Install PyTorch and its dependencies
RUN pip3 install torch torchvision torchaudio

# Install the packages from requirements.txt
RUN pip install -r requirements.txt

# Upgrade the TTS package
RUN pip install --upgrade TTS

# Expose the Streamlit port (default is 8501)
EXPOSE 8501

# Run the Streamlit app
#CMD ["streamlit", "run", "app2.py"]

###
#docker build -t xtts2 .
#podman build -t xtts2 .