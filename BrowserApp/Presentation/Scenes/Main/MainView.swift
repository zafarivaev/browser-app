//
//  MainView.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//  
//

import UIKit
import WebKit

final class MainView: UIView {
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    
    let urlTextField: UITextField = {
        let textField = AppTextField()
        textField.placeholder = "Input URL"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let historyButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.title = "View History"
        return item
    }()
    
    let webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.limitsNavigationsToAppBoundDomains = true
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    // MARK: - Setup Subviews
    
    private func setupSubviews() {
        addSubview(urlTextField)
        addSubview(webView)
        
        NSLayoutConstraint.activate([
            urlTextField.leftAnchor.constraint(equalTo: leftAnchor),
            urlTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            urlTextField.heightAnchor.constraint(equalToConstant: 50),
            urlTextField.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: leftAnchor),
            webView.rightAnchor.constraint(equalTo: rightAnchor),
            webView.topAnchor.constraint(equalTo: urlTextField.bottomAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
