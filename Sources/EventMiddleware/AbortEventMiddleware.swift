import Aftermath

public struct AbortEventMiddleware: EventMiddleware {

  let events: [AnyEvent.Type]

  public init(events: [AnyEvent.Type]) {
    self.events = events
  }

  public func intercept(_ event: AnyEvent, publish: Publish, next: Publish) throws {
    guard events.filter({ type(of: event) == $0 }).count == 0 else {
      log("Event has been aborted -> \(event)")
      return
    }

    try next(event)
  }
}
