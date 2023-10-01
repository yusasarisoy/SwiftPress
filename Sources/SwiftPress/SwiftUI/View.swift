import SwiftUI

extension View {
  /// Conditionally shows or hides a view based on a boolean condition, with the option to provide alternative content when the condition is false.
  ///
  /// Use this modifier to conditionally include a view in your SwiftUI hierarchy based on a boolean condition.
  /// If the condition is true, the view itself is displayed; if the condition is false, the content of the provided closure is displayed instead.
  ///
  /// Example usage:
  ///
  /// ```swift
  /// Text("Hello")
  ///   .if(someCondition) {
  ///     Text("Alternative Text")
  ///   }
  /// ```
  ///
  /// - Parameters:
  ///   - condition: A boolean condition that determines whether the view should be shown (true) or the content of the closure should be shown (false).
  ///   - content: A closure that returns a View. The content of this closure is displayed when the condition is false.
  ///
  /// - Returns: A modified view. If the condition is true, it returns `self`. If the condition is false, it returns the view produced by the content closure.
  @ViewBuilder 
  func `if`<Content: View>(
    _ condition: Bool,
    content: () -> Content
  ) -> some View {
    if condition {
      self
    } else {
      content()
    }
  }
}
