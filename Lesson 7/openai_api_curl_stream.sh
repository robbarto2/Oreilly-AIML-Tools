curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -H "Accept: text/event-stream" \
  -d "{
    \"model\": \"${OPENAI_MODEL}\",
    \"messages\": [{\"role\": \"user\", \"content\": \"Explain Q-LoRA in 3 steps.\"}],
    \"stream\": true
  }"