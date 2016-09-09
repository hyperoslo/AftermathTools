import Aftermath

// MARK: - Log Command Middleware

public struct LogCommandMiddleware: CommandMiddleware {

  public typealias Handler = (AnyCommand -> Void)

  public var handler: Handler = { command in
    log("Command executed: \(command)")
  }

  public init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  public func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    handler(command)
    try next(command)
  }
}

// MARK: - Error Command Middleware

public struct ErrorCommandMiddleware: CommandMiddleware {

  public typealias Handler = (AnyCommand, ErrorType) -> Void

  public var handler: Handler = { command in
    log("Command failed with error: \(command)")
  }

  public init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  public func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    do {
      try next(command)
    } catch {
      handler(command, error)
      throw error
    }
  }
}
