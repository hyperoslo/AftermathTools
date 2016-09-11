import Aftermath

public struct SilenceEventMiddleware: EventMiddleware {

  var error: ErrorType?

  public init(error: ErrorType? = nil) {
    self.error = error
  }

  public func intercept(event: AnyEvent, publish: Publish, next: Publish) throws {
    log("Silence mode: event has been blocked -> \(event)")

    if let error = error {
      throw error
    }
  }
}
