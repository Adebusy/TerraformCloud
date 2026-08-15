
def lambda_handler(event, context):
    print("Event:", event)
    message = 'Hello {} !'.format(event['Key1'])
    return {
        'message' : message
    }