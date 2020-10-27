# swiftLambdaTemplate
This project is a template for [swiftLambda](https://github.com/robipresotto/swiftLambda).

### AWS CloudFormation (Lambda + ApiGateway)
![alt text](https://github.com/robipresotto/swiftLambdaTemplate/blob/main/CloudFormation/template-designer.png?raw=true)

### AWS Lambda Function

```swift
import AWSLambdaRuntime

private struct Request: Codable {
  let name: String
}

private struct Response: Codable {
  let message: String
}

Lambda.run { (context, request: Request, callback: @escaping (Result<Response, Error>) -> Void) in
  callback(.success(Response(message: "Hello, \(request.name)!")))
}
```
