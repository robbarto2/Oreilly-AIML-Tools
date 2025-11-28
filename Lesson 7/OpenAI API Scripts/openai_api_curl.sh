#!/bin/bash

# OpenAI API Chat Completion Script
# Usage: ./openai_api.sh [user_message]

# Set default values if environment variables are not set
OPENAI_MODEL="${OPENAI_MODEL:-gpt-3.5-turbo}"
DEFAULT_MESSAGE="Summarize RAFT vs RLHF in 5 bullets."

# Use provided message or default
USER_MESSAGE="${1:-$DEFAULT_MESSAGE}"

# Check if API key is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: OPENAI_API_KEY environment variable is not set"
    echo "Please set it with: export OPENAI_API_KEY='your-api-key-here'"
    exit 1
fi

echo "Making API call to OpenAI..."
echo "Model: $OPENAI_MODEL"
echo "Message: $USER_MESSAGE"
echo ""

curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"${OPENAI_MODEL}\",
    \"messages\": [
      {\"role\": \"system\", \"content\": \"You are a concise assistant.\"},
      {\"role\": \"user\", \"content\": \"$USER_MESSAGE\"}
    ],
    \"temperature\": 0.3,
    \"max_tokens\": 300
  }"