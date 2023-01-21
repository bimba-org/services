import json
from pathlib import Path

services = Path("services")
result_file = Path("services.json")

result = []

for service in services.glob("*.json"):
    data = json.loads(service.read_text())
    data["id"] = service.stem
    result.append(data)

text = json.dumps(result, separators=(",", ":"))
result_file.write_text(text)
