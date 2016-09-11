import Aftermath

public struct SilenceCommandMiddleware: CommandMiddleware {

  var error: ErrorType?

  public init(error: ErrorType? = nil) {
    self.error = error
  }

  public func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    log("Silence mode: event has been blocked -> \(command)")

    if let error = error {
      throw error
    }
  }
}
