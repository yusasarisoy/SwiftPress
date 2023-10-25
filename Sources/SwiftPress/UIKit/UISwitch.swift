import UIKit

public extension UISwitch {
  /// Creates a custom UISwitch with specified properties.
  ///
  /// - Parameters:
  ///   - isOn: The initial state of the switch (on or off).
  ///   - tintColor: The tint color of the switch when it's in the off state (default is system blue).
  ///   - onTintColor: The tint color of the switch when it's in the on state (default is system green).
  ///
  /// Example:
  ///
  /// ```swift
  /// let customSwitch = UISwitch.customSwitch(
  ///   isOn: true,
  ///   tintColor: .red,
  ///   onTintColor: .green
  /// )
  /// ```
  ///
  /// - Returns: A customized UISwitch instance.
  static func customSwitch(
    isOn: Bool,
    tintColor: UIColor = .systemBlue,
    onTintColor: UIColor = .systemGreen
  ) -> UISwitch {
    let switchControl = UISwitch()
    switchControl.isOn = isOn
    switchControl.tintColor = tintColor
    switchControl.onTintColor = onTintColor
    return switchControl
  }
}
