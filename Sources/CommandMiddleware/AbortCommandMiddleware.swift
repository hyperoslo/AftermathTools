import Aftermath

public struct AbortCommandMiddleware: CommandMiddleware {

  let commands: [AnyCommand.Type]

  public init(commands: [AnyCommand.Type]) {
    self.commands = commands
  }

  public func intercept(command: AnyCommand, execute: Execute, next: Execute) throws {
    guard commands.filter({ type(of: command) == $0 }).count == 0 else {
      log("Command has been aborted -> \(command)")
      return
    }

    try next(command)
  }
}
