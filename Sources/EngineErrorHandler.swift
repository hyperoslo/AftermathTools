import Aftermath

struct EngineErrorHandler: ErrorHandler {

  func handleError(error: ErrorType) {
    if let error = error as? Error {
      log("Engine error: \(error)")
    } else if let warning = error as? Warning {
      log("Engine warning: \(warning)")
    } else {
      log("Unknown error: \(error)")
    }
  }
}
