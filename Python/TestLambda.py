import json
import time

staticInt = 0

def lambda_handler(event, context):
    global staticInt

    staticInt += 1
    rs_body = f'Python Lambda:\n I saw that vaiable {staticInt} times'
    print(rs_body);

    return {
        'statusCode': 200,
        'body': rs_body
    }
