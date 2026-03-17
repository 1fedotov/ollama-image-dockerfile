FROM ollama/ollama:latest

# 1. Bake the script into the image
COPY ./ollama-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 2. OPTIONAL: Bake the model in too (so it starts instantly!)
# This saves you from waiting for a 'pull' every time the cloud wakes up
RUN (ollama serve &) && sleep 5 && ollama pull gemma3:270m && pkill ollama

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]