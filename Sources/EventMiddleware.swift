import Aftermath

// MARK: - Log Event Middleware

struct LogEventMiddleware: EventMiddleware {

  typealias Handler = AnyEvent -> Void

  var handler: Handler = { event in
    log("Event published: \(event)")
  }

  init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  func intercept(event: AnyEvent, publish: Publish, next: Publish) throws {
    handler(event)
    try next(event)
  }
}

// MARK: - Error Event Middleware

struct ErrorEventMiddleware: EventMiddleware {

  typealias Handler = (AnyEvent, ErrorType) -> Void

  var handler: Handler = { event in
    log("Event failed with error: \(event)")
  }

  init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  func intercept(event: AnyEvent, publish: Publish, next: Publish) throws {
    do {
      try next(event)
    } catch {
      handler(event, error)
      throw error
    }
  }
}
