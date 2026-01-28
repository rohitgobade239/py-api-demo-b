import os

api_key = os.getenv("API_KEY")

if api_key:
    print("Secret successfully accessed inside Python!")
    print("Length of secret:", len(api_key))  # Never print the value itself
else:
    print("No secret found!")
