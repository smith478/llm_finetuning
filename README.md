# LLM fine tuning

The goal here is to have a few different options and examples of fine tuning LLMs for various tasks. Here are a few nice references:

- [Mistral 7B Fine-Tuning - Gathnex](https://gathnex.medium.com/mistral-7b-fine-tuning-a-step-by-step-guide-52122cdbeca8)

## Getting started

### Docker

The docker image can be built using `./Dockerfile`. You can build it using the following command, run from the root directory

```bash
docker build . -f Dockerfile --rm -t llm-finetuning:latest
```

### Run docker container

First navigate to this repo on your local machine. Then run the container:

```bash
docker run --gpus all --name llm-finetuning -it --rm -p 8888:8888 -p 8501:8501 -p 8000:8000 --entrypoint /bin/bash -v $(pwd):/llm_finetuning llm-finetuning:latest
```

### Run the fast api service from the container

Inside the container: 
```bash
uvicorn speech_to_text_service:app --reload --host 0.0.0.0
```
The service will be available at localhost:8000

### Run jupyter from the container
Inside the Container:
```bash
jupyter lab --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token=
```

Host machine access this url:
```bash
localhost:8888/<YOUR TREE HERE>
```

### Run streamlit from the container
Inside the container:
```bash
streamlit run parser_app.py
```
OR
```bash
streamlit run speech_to_text_app.py
```

Host machine:
```bash
localhost:8501
```

## TODO
- Fine tuning instruct llm
- Conversation summarization/notes
- RAG example
