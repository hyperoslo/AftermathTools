// MARK: - Errors

public struct Error: Error, CustomStringConvertible, CustomDebugStringConvertible {

  public let description: String

  public init(description: String) {
    self.description = description
  }

  public var debugDescription: String {
    return description
  }
}

// MARK: - Functions

func log(_ text: String) {
  print("🔮 AFTERMATH: \(text)")
}
