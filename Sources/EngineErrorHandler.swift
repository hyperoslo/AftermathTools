import Aftermath

public struct EngineErrorHandler: ErrorHandler {

  public init() {}

  public func handleError(_ error: Error) {
    if let error = error as? Error {
      log("Engine error -> \(error)")
    } else if let warning = error as? Warning {
      log("Engine warning -> \(warning)")
    } else {
      log("Unknown error -> \(error)")
    }
  }
}
