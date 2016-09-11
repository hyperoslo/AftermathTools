import Aftermath

protocol Action: AnyCommand, CommandProducer {
  func invoke() throws
}

public struct ActionMiddleware: CommandMiddleware {

  public init() {}

  public func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    guard let action = command as? Action else {
      try next(command)
      return
    }

    try action.invoke()
  }
}
