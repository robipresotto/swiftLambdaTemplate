
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
