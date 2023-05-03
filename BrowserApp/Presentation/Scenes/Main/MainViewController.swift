//
//  MainViewController.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//  
//

import UIKit
import WebKit

final class MainViewController: AppViewController {
    
    // MARK: - Properties
    
    private let coordinator: MainCoordinator
    private let rootView: MainView
    private let viewModel: MainViewModelInput
    
    // MARK: - Initialization
    
    init(
        coordinator: MainCoordinator,
        rootView: MainView,
        viewModel: MainViewModelInput
    ) {
        self.coordinator = coordinator
        self.rootView = rootView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.historyButtonItem.target = self
        rootView.historyButtonItem.action = #selector(historyButtonItemHandler)
        navigationItem.rightBarButtonItem = rootView.historyButtonItem
        
        rootView.urlTextField.addTarget(self, action: #selector(urlTextFieldDidEndEditing), for: .editingDidEnd)
        
        rootView.webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Main"
    }
    
    // MARK: - Events
    
    @objc func historyButtonItemHandler(_ sender: UIBarButtonItem) {
        coordinator.coordinateToHistory(itemSelectionHandler: { [weak self] urlString in
            self?.rootView.urlTextField.text = urlString
            self?.viewModel.didInputUrlString(urlString)
        })
    }
    
    @objc func urlTextFieldDidEndEditing(_ sender: UITextField) {
        guard let text = sender.text else { return }
        viewModel.didInputUrlString(text)
    }
}

// MARK: - MainViewModel Output

extension MainViewController: MainViewModelOutput {
    func didPrepareUrlRequest(_ request: URLRequest) {
        rootView.webView.load(request)
    }
}

// MARK: - WKNavigationDelegate

extension MainViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        guard let url = navigationAction.request.url, url.absoluteString != "about:blank" else {
            return
        }
        rootView.urlTextField.text = url.absoluteString
        viewModel.didPerformNavigation(with: url)
    }
}
