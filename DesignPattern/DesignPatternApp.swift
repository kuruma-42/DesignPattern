//
//  DesignPatternApp.swift
//  DesignPattern
//
//  Created by Yong Jun Cha on 2022/06/06.
//

import SwiftUI

@main
struct DesignPatternApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: DesignPatternDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
