# Test Frontend and Backend endpoints
Once the infrastructure is correctly built with the make commands, please make sure to use the following instructions to test the backend and frontend endpoints.

## Backend endpoint
After running:
```
    make tf-apply
```
Some relevant data will the provided as outputs of the terraform process. One of those outputs is 'aws_api_gateway_rest_api_id' which is the API gateway ID. To hit the backend endpoint, please copy that ID and use the following command:
```
    curl http://localhost:4566/restapis/${aws_api_gateway_rest_api_id}/stage/_user_request_/GET/
```

## Frontend endpoint
Once the Terraform infrastructure is built, please open the following url to hit the frontend endpoint:

```
http://localhost:4566/frontend-app-bucket/index.html
```
