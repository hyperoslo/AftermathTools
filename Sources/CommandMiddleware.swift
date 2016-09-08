import Aftermath

// MARK: - Log Command Middleware

struct LogCommandMiddleware: CommandMiddleware {

  typealias Handler = (AnyCommand -> Void)

  var handler: Handler = { command in
    log("Command executed: \(command)")
  }

  init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    handler(command)
    try next(command)
  }
}

// MARK: - Error Command Middleware

struct ErrorCommandMiddleware: CommandMiddleware {

  typealias Handler = (AnyCommand, ErrorType) -> Void

  var handler: Handler = { command in
    log("Command failed with error: \(command)")
  }

  init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    do {
      try next(command)
    } catch {
      handler(command, error)
      throw error
    }
  }
}
