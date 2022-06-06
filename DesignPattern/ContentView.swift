//
//  ContentView.swift
//  DesignPattern
//
//  Created by Yong Jun Cha on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: DesignPatternDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(DesignPatternDocument()))
    }
}
