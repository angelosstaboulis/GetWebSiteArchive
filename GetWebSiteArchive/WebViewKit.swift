//
//  WebViewKit.swift
//  GetWebSiteArchive
//
//  Created by Angelos Staboulis on 16/12/23.
//

import Foundation
import WebKit
class WebViewKit:NSObject,WKNavigationDelegate{
    var webView = WKWebView()
    var saveURL:String
    var loadURL:String
    init(saveURL: String,loadURL:String) {
        self.saveURL = saveURL
        self.loadURL = loadURL
        super.init()
        self.webView.navigationDelegate =  self
    }
    func loadWebURL(){
        self.webView.load(URLRequest(url: URL(string:loadURL)!))
    }
    func savePDF(){
        DispatchQueue.main.async{
            self.webView.createWebArchiveData { result in
                switch result {
                case .success(let data):
                    FileManager.default.createFile(atPath: self.saveURL, contents: data)
                case .failure(let failure):
                    debugPrint("failure=",failure)
                }
            }
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        savePDF()
    }
}
