//
//  AppTextField.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import UIKit

final class AppTextField: UITextField {
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        autocapitalizationType = .none
        autocorrectionType = .no
        tintColor = .systemBlue
        textColor = .systemBlue
        borderStyle = .roundedRect
    }
    
    // MARK: - Spacing
    
    private let insets = UIEdgeInsets(
        top: 0,
        left: 15,
        bottom: 0,
        right: 15
    )
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
