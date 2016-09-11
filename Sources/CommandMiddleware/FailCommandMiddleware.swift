import Aftermath

public struct FailCommandMiddleware: CommandMiddleware {

  public typealias Failure = (command: AnyCommand.Type, error: ErrorType)

  let failures: [Failure]

  public init(failures: [Failure]) {
    self.failures = failures
  }

  public func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    guard let failure = failures.filter({ command.dynamicType == $0.command }).first else {
      try next(command)
      return
    }

    throw failure.error
  }
}
