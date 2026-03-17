#!/bin/bash

# Start Ollama in the background
ollama serve &

# Wait for it to be ready
echo "Waiting for Ollama..."
while ! ollama list > /dev/null 2>&1; do
  sleep 2
done

# Pull the model
echo "Pulling model: ${OLLAMA_MODEL}"
ollama pull "${OLLAMA_MODEL:-gemma3:270m}"

# Bring the background process back to the foreground
wait $!