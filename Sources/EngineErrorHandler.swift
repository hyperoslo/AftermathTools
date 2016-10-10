import Aftermath

public struct EngineErrorHandler: ErrorHandler {

  public init() {}

  public func handle(error: Error) {
    if let error = error as? Failure {
      log("Engine error -> \(error)")
    } else if let warning = error as? Warning {
      log("Engine warning -> \(warning)")
    } else {
      log("Unknown error -> \(error)")
    }
  }
}
