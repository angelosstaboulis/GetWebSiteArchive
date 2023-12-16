//
//  GetWebSiteArchiveApp.swift
//  GetWebSiteArchive
//
//  Created by Angelos Staboulis on 16/12/23.
//

import SwiftUI

@main
struct GetWebSiteArchiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(exportURL: "", exportFolder: "", presented: false).frame(width:400,height:400)
        }.windowResizability(.contentSize)
    }
}
