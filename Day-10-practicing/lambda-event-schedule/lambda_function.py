
import json
from datetime import datetime, timezone

def lambda_handler(event, context):
    message = {
        "message": "Lambda executed successfully!",
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "event": event
    }

    print(json.dumps(message))

    return {
        "statusCode": 200,
        "body": json.dumps(message)
    }