# Use an official Huggingface Transformers image as a parent image
FROM huggingface/transformers-pytorch-gpu:latest

# Set the working directory in the Docker image
WORKDIR /llm_finetuning

# Copy the requirements.txt file from your local system to the Docker image
COPY requirements.txt ./

# Upgrade pip in the Docker image
RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt