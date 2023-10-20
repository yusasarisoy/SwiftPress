import UIKit

public extension UIView {
  /// Create and activate constraints to align the edges of the view with its superview's edges, optionally applying padding.
  ///
  /// This method simplifies the process of setting up constraints to make the view's edges match its superview's edges.
  /// It creates and activates constraints for the leading, trailing, top, and bottom edges of the view, ensuring alignment
  /// with the corresponding edges of its superview. An optional padding value can be provided to add space between
  /// the view's edges and the superview's edges.
  ///
  /// - Parameter padding: The padding value to apply to all edges. Default is zero.
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  /// - Note: The `translatesAutoresizingMaskIntoConstraints` property of the view is set to `false` within this method to ensure
  ///   compatibility with Auto Layout.
  ///
  /// - Warning: Using excessive padding values or very large numbers may result in unexpected layout issues.
  ///
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  ///
  /// Example:
  ///
  /// ```swift
  /// let myFirstView = UIView()
  /// myFirstView.edgesEqualToSuperview()
  ///
  /// let mySecondView = UIView()
  /// mySecondView.edgesEqualToSuperview(padding: 16)
  /// ```
  @discardableResult
  func edgesEqualToSuperview(padding: CGFloat = .zero) -> [NSLayoutConstraint] {
    guard let superview else {
      return []
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraints = [
      leadingAnchor.constraint(
        equalTo: superview.leadingAnchor,
        constant: padding
      ),
      trailingAnchor.constraint(
        equalTo: superview.trailingAnchor,
        constant: -padding
      ),
      topAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.topAnchor,
        constant: padding
      ),
      bottomAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
        constant: -padding
      )
    ]

    NSLayoutConstraint.activate(constraints)

    return constraints
  }

  /// Create and activate Auto Layout constraints to align the horizontal edges of the view with its superview's edges, optionally applying padding.
  ///
  /// This method simplifies the process of setting up constraints to make the view's horizontal edges match its superview's edges.
  /// It creates and activates constraints for the leading and trailing edges, ensuring alignment with the corresponding edges of its superview.
  /// An optional padding value can be provided to add space between the view's edges and the superview's edges.
  ///
  /// - Parameter padding: The padding value to apply to the leading and trailing edges. Default is zero.
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  /// - Note: The `translatesAutoresizingMaskIntoConstraints` property of the view is set to `false` within this method to ensure
  ///   compatibility with Auto Layout.
  ///
  /// - Warning: Using excessive padding values or very large numbers may result in unexpected layout issues.
  ///
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  ///
  /// Example:
  ///
  /// ```swift
  /// let myFirstView = UIView()
  /// myFirstView.horizontalEdgesEqualToSuperview()
  ///
  /// let mySecondView = UIView()
  /// mySecondView.horizontalEdgesEqualToSuperview(padding: 16)
  /// ```
  @discardableResult
  func horizontalEdgesEqualToSuperview(padding: CGFloat = .zero) -> [NSLayoutConstraint] {
    guard let superview else {
      return []
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraints = [
      leadingAnchor.constraint(
        equalTo: superview.leadingAnchor,
        constant: padding
      ),
      trailingAnchor.constraint(
        equalTo: superview.trailingAnchor,
        constant: -padding
      ),
      topAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.topAnchor
      ),
      bottomAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.bottomAnchor
      )
    ]

    NSLayoutConstraint.activate(constraints)

    return constraints
  }

  /// Creates and activates a constraint that sets the height of the view equal to its width.
  ///
  /// This extension method is useful for maintaining a square aspect ratio for a UIView.
  ///
  /// - Returns: The activated `NSLayoutConstraint` that sets the height equal to the width of the view.
  ///
  /// - Note: This method should be called on a view that is already added to a superview.
  /// - Warning: If the view is not in a superview, this method will return nil, and the constraint won't be created.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Create a UIView and add it to a superview.
  /// let containerView = UIView()
  /// containerView.translatesAutoresizingMaskIntoConstraints = false
  /// view.addSubview(containerView)
  ///
  /// // Create a red square view and add it to the containerView.
  /// let redSquare = UIView()
  /// redSquare.translatesAutoresizingMaskIntoConstraints = false
  /// redSquare.backgroundColor = .red
  /// containerView.addSubview(redSquare)
  ///
  /// // Set the height of the red square equal to its width.
  /// redSquare.heightEqualToWidth()
  ///
  /// // Add additional constraints to position the red square within the containerView.
  /// NSLayoutConstraint.activate([
  ///   redSquare.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
  ///   redSquare.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
  ///   redSquare.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5)
  /// ])
  /// ```
  /// 
  @discardableResult
  func heightEqualToWidth() -> NSLayoutConstraint? {
    guard let superview else {
      return .none
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraint = heightAnchor.constraint(equalTo: widthAnchor)
    superview.addConstraint(constraint)

    return constraint
  }

  /// Creates and activates a constraint that sets the height of the view to a specific constant value.
  ///
  /// This extension method is useful for setting a fixed height for a UIView.
  ///
  /// - Parameter constant: The constant height value to set.
  ///
  /// - Returns: The activated `NSLayoutConstraint` that sets the height to the specified constant value.
  ///
  /// - Note: This method should be called on a view that is already added to a superview.
  /// - Warning: If the view is not in a superview, this method will return nil, and the constraint won't be created.
  ///
  /// - Example:
  ///
  /// ```swift
  /// // Create a UIView and add it to a superview.
  /// let containerView = UIView()
  /// containerView.translatesAutoresizingMaskIntoConstraints = false
  /// view.addSubview(containerView)
  ///
  /// // Create a red view and add it to the containerView.
  /// let redView = UIView()
  /// redView.translatesAutoresizingMaskIntoConstraints = false
  /// redView.backgroundColor = .red
  /// containerView.addSubview(redView)
  ///
  /// // Set the height of the red view to a constant value.
  /// redView.heightEqualTo(100)
  ///
  /// // Add additional constraints to position the red view within the containerView.
  /// NSLayoutConstraint.activate([
  ///   redView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
  ///   redView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
  ///   redView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5)
  /// ])
  /// ```
  @discardableResult
  func heightEqualTo(_ constant: CGFloat) -> NSLayoutConstraint? {
    guard let superview else {
      return .none
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraint = heightAnchor.constraint(equalToConstant: constant)
    superview.addConstraint(constraint)

    return constraint
  }

  /// Centers the view horizontally and vertically within its superview.
  /// - Parameter priority: Optional priority for the constraints. Default is UILayoutPriority.required.
  /// - Returns: An array of NSLayoutConstraint objects representing the added constraints.
  ///
  ///  Example:
  ///
  /// ```swift
  /// let superview = UIView()
  /// let view = UIView()
  ///
  /// superview.addSubview(view)
  ///
  /// // Center the 'view' within its superview.
  /// view.centerInSuperview()
  /// ```
  ///
  @discardableResult
  func centerInSuperview(priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
    guard let superview else {
      fatalError("The view must have a superview to be centered.")
    }

    translatesAutoresizingMaskIntoConstraints = false

    let centerXConstraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
    let centerYConstraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)

    centerXConstraint.priority = priority
    centerYConstraint.priority = priority

    NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])

    return [centerXConstraint, centerYConstraint]
  }

  /// A convenient extension for NSLayoutConstraint to easily center the Y-axis of a view to a specified NSLayoutYAxisAnchor.
  ///
  /// This method creates and adds a NSLayoutConstraint to the superview of the current view,
  /// aligning the centerYAnchor of the view with the specified anchor. It also disables the view's translatesAutoresizingMaskIntoConstraints property if it's not already disabled.
  ///
  /// - Parameter anchor: The NSLayoutYAxisAnchor to which the centerYAnchor of the view will be aligned.
  /// - Returns: The NSLayoutConstraint that has been created and added to the superview, or nil if the view does not have a superview.
  ///
  /// - Note: The `@discardableResult` attribute is used to suppress the warning that occurs when the result of this function is not used.
  ///  It is safe to ignore this result if you don't need to reference the NSLayoutConstraint later.
  ///
  /// - Example:
  ///
  /// ```swift
  /// let myView = UIView()
  /// myView.centerYEqualTo(someOtherView.centerYAnchor)
  /// ```
  ///
  /// - Precondition: The view on which this method is called should have a superview, otherwise, this method will return nil.
  ///
  /// - Postcondition: If the view did not have translatesAutoresizingMaskIntoConstraints set to false, this method sets it to false before adding the constraint to the superview.
  ///
  @discardableResult
  func centerYEqualTo(_ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint? {
    guard let superview else {
      return .none
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraint = centerYAnchor.constraint(equalTo: anchor)
    superview.addConstraint(constraint)

    return constraint
  }

  /// An extension for UIView to add a border with a specified width and color.
  ///
  /// - Parameters:
  ///   - width: The width of the border, in points.
  ///   - color: The color of the border. It should be a `UIColor` object.
  ///
  /// - Note: This extension modifies the properties of the view's layer to add a border.
  ///         Make sure to set the view's `layer.masksToBounds` property to `true` if you want the border to be visible.
  ///         If you do not set `layer.masksToBounds` to `true`, the border may not appear.
  ///
  /// - Warning: Be cautious when using this extension with views that have subviews.
  ///
  /// - Example:
  ///
  /// ```swift
  /// let myView = UIView(
  ///   frame: CGRect(
  ///     x: 0,
  ///     y: 0,
  ///     width: 100,
  ///     height: 100
  ///   )
  /// )
  ///
  /// myView.addBorder(
  ///   width: 2.0,
  ///   color: .blue
  /// )
  ///
  /// myView.layer.masksToBounds = true // Ensure that the border is visible.
  /// ```
  ///
  func addBorder(
    width: CGFloat, 
    color: UIColor
  ) {
    layer.borderWidth = width
    layer.borderColor = color.cgColor
  }

  /// Add a shadow to the view.
  ///
  /// - Parameters:
  ///   - color: The shadow color.
  ///   - opacity: The shadow opacity (0.0 to 1.0).
  ///   - offset: The shadow offset.
  ///   - radius: The shadow radius.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Add a shadow to a view with a red color, 0.5 opacity, offset of (0, 3), and radius of 5.
  /// myView.addShadow(
  ///   color: .red,
  ///   opacity: 0.5,
  ///   offset: CGSize(
  ///     width: 0,
  ///     height: 3
  ///   ),
  ///   radius: 5
  /// )
  /// ```
  ///
  /// Use this extension to add a shadow effect to a UIView. You can customize the shadow by specifying its color, opacity, offset (distance from the view), and radius (blur effect). By setting `layer.masksToBounds` to `false`, it allows the shadow to be visible. This is useful for enhancing the visual appearance of UI elements.
  ///
  /// - Parameter color: The color of the shadow.
  /// - Parameter opacity: The opacity of the shadow (0.0 to 1.0, where 0.0 is fully transparent and 1.0 is fully opaque).
  /// - Parameter offset: The shadow's offset from the view's bounds. Use `CGSize` to specify the horizontal and vertical offset (e.g., `CGSize(width: 0, height: 3)`).
  /// - Parameter radius: The blur radius of the shadow. Larger values result in a more blurred shadow.
  ///
  func addShadow(
    color: UIColor,
    opacity: Float,
    offset: CGSize,
    radius: CGFloat
  ) {
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offset
    layer.shadowRadius = radius
    layer.masksToBounds = false
  }
}

// MARK: - Builder

/// A protocol for building and configuring objects.
public protocol Builder {
  /// The type of object that can be built and configured.
  associatedtype Element

  /// Build and configure an object.
  ///
  /// - Parameter configure: A closure that takes the object as its argument and
  ///   allows you to configure its properties.
  /// - Returns: The configured object.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Create and configure a UILabel using the Builder protocol.
  /// let titleLabel = UILabel().build {
  ///   $0.text = "Hello, World!"
  ///   $0.textColor = .darkText
  /// }
  /// ```
  ///
  /// or
  ///
  /// ```swift
  /// let titleLabel = UILabel().build { label in
  ///   label.text = "Hello, World!"
  ///   label.textColor = .darkText
  /// }
  /// ```
  ///
  @discardableResult
  func build(_ configure: (_ element: Element) -> Void) -> Element
}

public extension Builder {
  /// Build and configure an object.
  ///
  /// - Parameter configure: A closure that takes the object as its argument and
  ///   allows you to configure its properties.
  /// - Returns: The configured object.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Create and configure a UILabel using the Builder protocol.
  /// let titleLabel = UILabel().build {
  ///   $0.text = "Hello, World!"
  ///   $0.textColor = .darkText
  /// }
  /// ```
  /// 
  /// or
  ///
  /// ```swift
  /// let titleLabel = UILabel().build { label in
  ///   label.text = "Hello, World!"
  ///   label.textColor = .darkText
  /// }
  /// ```
  ///
  @discardableResult
  func build(_ configure: (_ element: Self) -> Void) -> Self {
    configure(self)

    // If the object is a UIView or its subclass, 
    // set translatesAutoresizingMaskIntoConstraints to false.
    if let view = self as? UIView {
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }
}

/// Conform NSObject to the Builder protocol to make it available for all NSObject subclasses.
extension NSObject: Builder { }
