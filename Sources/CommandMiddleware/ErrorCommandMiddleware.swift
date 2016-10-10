import Aftermath

public struct ErrorCommandMiddleware: CommandMiddleware {

  public typealias Handler = (AnyCommand, Error) -> Void

  public var handler: Handler = { command in
    log("Command failed with error -> \(command)")
  }

  public init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  public func intercept(_ command: AnyCommand, execute: Execute, next: Execute) throws {
    do {
      try next(command)
    } catch {
      handler(command, error as! Error)
      throw error
    }
  }
}
