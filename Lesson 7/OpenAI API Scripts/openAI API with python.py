import os
import requests

API_KEY = os.environ["OPENAI_API_KEY"]
MODEL = os.getenv("OPENAI_MODEL", "gpt-4o-mini")  # swap as needed

resp = requests.post(
    "https://api.openai.com/v1/chat/completions",
    headers={
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    },
    json={
        "model": MODEL,
        "messages": [
            {"role": "system", "content": "You are terse."},
            {"role": "user", "content": "Give a 1-paragraph overview of Model Context Protocol."}
        ],
        "temperature": .2
    },
    timeout=60
)

try:
    resp.raise_for_status()
    data = resp.json()
    print(data["choices"][0]["message"]["content"])
except requests.HTTPError as http_err:
    # Show HTTP status and body for easier debugging
    print("HTTPError:", http_err)
    print("Response text:", getattr(resp, "text", ""))
except requests.RequestException as req_err:
    print("RequestException:", req_err)