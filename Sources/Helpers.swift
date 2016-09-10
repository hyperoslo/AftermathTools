// MARK: - Errors

public struct Error: ErrorType, CustomStringConvertible, CustomDebugStringConvertible {

  public let description: String

  public init(description: String) {
    self.description = description
  }

  public var debugDescription: String {
    return description
  }
}

// MARK: - Functions

func log(text: String) {
  print("🔮 AFTERMATH: \(text)")
}
