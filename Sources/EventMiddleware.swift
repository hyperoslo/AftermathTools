import Aftermath

// MARK: - Log Event Middleware

public struct LogEventMiddleware: EventMiddleware {

  public typealias Handler = AnyEvent -> Void

  public var handler: Handler = { event in
    log("Event published -> \(event)")
  }

  public init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  public func intercept(event: AnyEvent, publish: Publish, next: Publish) throws {
    handler(event)
    try next(event)
  }
}

// MARK: - Error Event Middleware

public struct ErrorEventMiddleware: EventMiddleware {

  public typealias Handler = (AnyEvent, ErrorType) -> Void

  public var handler: Handler = { event in
    log("Event failed with error -> \(event)")
  }

  public init(handler: Handler? = nil) {
    if let handler = handler {
      self.handler = handler
    }
  }

  public func intercept(event: AnyEvent, publish: Publish, next: Publish) throws {
    do {
      try next(event)
    } catch {
      handler(event, error)
      throw error
    }
  }
}

// MARK: - Abort Event Middleware

public struct AbortEventMiddleware: EventMiddleware {

  let events: [AnyEvent.Type]

  public init(events: [AnyEvent.Type]) {
    self.events = events
  }

  public func intercept(event: AnyEvent, publish: Publish, next: Publish) throws {
    guard events.filter({ event.dynamicType == $0 }).count == 0 else {
      log("Event has been aborted -> \(event)")
      return
    }

    try next(event)
  }
}
