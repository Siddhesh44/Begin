//
//  barber shop extension.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

// MARK: textFieldPadding
class UITextFieldPadding1 : UITextField {
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

// MARK: Button image
class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 23, bottom: 5, right: (bounds.width - 45))
            // titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}

// MARK: Button class circular  button, border width, border color

@IBDesignable
class circularButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circularButton()
    }
    
    // circular
    @IBInspectable var circular: Bool = false {
        didSet {
            circularButton()
        }
    }
    
    func circularButton() {
        layer.cornerRadius = circular ? frame.size.width * 0.5 : 0
    }
    
    // button border
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}

// MARK: Button class round button, round corner , border width, border color

@IBDesignable
class RoundButton: UIButton {
    
    // rounded corner
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedButton()
    }
    
    // round
    @IBInspectable var rounded: Bool = false {
        didSet {
            roundedButton()
        }
    }
    
    func roundedButton() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    
    // button border
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}

// MARK: Rounded Button
extension UIButton{
    func roundButton()
    {
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
        adjustsImageWhenHighlighted = false
    }
    
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func makeCircularButtonWithShadow(){
        layer.cornerRadius = frame.size.width * 0.5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2.0
    }
}

// MARK: GradientBackground
extension UIView{
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: rounded view
    func roundedView()
    {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func roundedView1()
    {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        layer.borderWidth = 0.5
    }
}

// MARK: Search bar
extension UISearchBar{
    func customSearchBar()
    {
        searchTextField.backgroundColor = .clear
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    func getTextField() -> UITextField? { return value(forKey: "searchField") as? UITextField }
    func set(textColor: UIColor) { if let textField = getTextField() { textField.textColor = textColor } }
    func setPlaceholder(textColor: UIColor) { getTextField()?.setPlaceholder(textColor: textColor) }
    func setClearButton(color: UIColor) { getTextField()?.setClearButton(color: color) }
    
    func setTextField(color: UIColor) {
        guard let textField = getTextField() else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
        case .prominent, .default: textField.backgroundColor = color
        @unknown default: break
        }
    }
    
    func setSearchImage(color: UIColor) {
        guard let imageView = getTextField()?.leftView as? UIImageView else { return }
        imageView.tintColor = color
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
    }
}


private extension UITextField {
    
    private class Label: UILabel {
        private var _textColor = UIColor.lightGray
        override var textColor: UIColor! {
            set { super.textColor = _textColor }
            get { return _textColor }
        }
        
        init(label: UILabel, textColor: UIColor = .lightGray) {
            _textColor = textColor
            super.init(frame: label.frame)
            self.text = label.text
            self.font = label.font
        }
        
        required init?(coder: NSCoder) { super.init(coder: coder) }
    }
    
    
    private class ClearButtonImage {
        static private var _image: UIImage?
        static private var semaphore = DispatchSemaphore(value: 1)
        static func getImage(closure: @escaping (UIImage?)->()) {
            DispatchQueue.global(qos: .userInteractive).async {
                semaphore.wait()
                DispatchQueue.main.async {
                    if let image = _image { closure(image); semaphore.signal(); return }
                    guard let window = UIApplication.shared.windows.first else { semaphore.signal(); return }
                    let searchBar = UISearchBar(frame: CGRect(x: 0, y: -200, width: UIScreen.main.bounds.width, height: 44))
                    window.rootViewController?.view.addSubview(searchBar)
                    searchBar.text = "txt"
                    searchBar.layoutIfNeeded()
                    _image = searchBar.getTextField()?.getClearButton()?.image(for: .normal)
                    closure(_image)
                    searchBar.removeFromSuperview()
                    semaphore.signal()
                }
            }
        }
    }
    
    func setClearButton(color: UIColor) {
        ClearButtonImage.getImage { [weak self] image in
            guard   let image = image,
                let button = self?.getClearButton() else { return }
            button.imageView?.tintColor = color
            button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    var placeholderLabel: UILabel? { return value(forKey: "placeholderLabel") as? UILabel }
    
    func setPlaceholder(textColor: UIColor) {
        guard let placeholderLabel = placeholderLabel else { return }
        let label = Label(label: placeholderLabel, textColor: textColor)
        setValue(label, forKey: "placeholderLabel")
    }
    
    func getClearButton() -> UIButton? { return value(forKey: "clearButton") as? UIButton }
    
}

// MARK: TextField
extension UITextField{
    func roundedTextField() {
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
    }
    
    func customTextField()
    {
        font = UIFont(name: "Tofino-Regular", size: 14)
        borderStyle = UITextField.BorderStyle.none
        backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        textColor = Colors.placeHolderColor
        autocorrectionType = UITextAutocorrectionType.no
        keyboardType = UIKeyboardType.default
        returnKeyType = UIReturnKeyType.default
        enablesReturnKeyAutomatically = true
        isUserInteractionEnabled = true
        clearButtonMode = UITextField.ViewMode.whileEditing
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
}

extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func setFont(font: UIFont, forText stringValue: String){
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}

// MARK: Gestures
extension UIViewController{
    
    // Tap gesture Action
    @objc func tapGesture()
    {
        view.endEditing(true)
    }
}

extension UIView{
    // For insert layer in Foreground
    func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
    // For insert layer in background
    func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.insertSublayer(gradient, at: 0)
    }
}


// MARK: Navigation bar


// MARK: UILabel

// label with icon

