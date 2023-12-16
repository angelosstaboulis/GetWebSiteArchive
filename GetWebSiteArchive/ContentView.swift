//
//  ContentView.swift
//  GetWebSiteArchive
//
//  Created by Angelos Staboulis on 16/12/23.
//

import SwiftUI
import WebKit
struct ContentView: View {
    @State var exportURL:String
    @State var exportFolder:String
    @State var webView = WebViewKit(saveURL: "", loadURL: "")
    @State var presented:Bool
    var body: some View {
        VStack {
            Text("Export URL").frame(width:300,height:45,alignment:.leading)
            TextField("",text:$exportURL).frame(width:300,height:45,alignment:.leading)
            Text("Export Folder").frame(width:300,height:45,alignment:.leading)
            TextField("",text:$exportFolder).frame(width:300,height:45,alignment:.leading)
            Button {
                    presented.toggle()
                    webView = WebViewKit(saveURL: "", loadURL: "")
                    webView.loadURL = exportURL
                    webView.saveURL = exportFolder
                    webView.loadWebURL()
                    webView.savePDF()
            } label: {
                Text("Create File")
            }.frame(width:300,height:60)
            
            
        }.alert("Information Message", isPresented: $presented) {
            
        } message: {
            Text("File was created")
        }

        
    }
}

#Preview {
    ContentView(exportURL: "", exportFolder: "", presented: false)
}
