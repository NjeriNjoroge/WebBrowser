//
//  ViewController.swift
//  Project4
//
//  Created by Grace on 30/05/2018.
//  Copyright © 2018 Grace. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://thecodegal.wordpress.com")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true

        let url = URL(string: "https://thecodegal.wordpress.com/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))

    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithwsift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true, completion: nil)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https//:" + action.title!)!
        webView.load(URLRequest(url: url))
    }

}

