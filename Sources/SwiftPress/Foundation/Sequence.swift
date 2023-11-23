// MARK: - Sequence

public extension Sequence where Element: OptionalType {
  func filterNils() -> [Element.Wrapped] {
    compactMap { $0.optional }
  }
}

// MARK: - OptionalType

public protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

// MARK: - Optional + OptionalType

extension Optional: OptionalType {
  public var optional: Wrapped? {
    self
  }
}
