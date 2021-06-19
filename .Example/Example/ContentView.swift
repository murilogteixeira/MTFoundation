//
//  ContentView.swift
//  Example
//
//  Created by Murilo Teixeira on 19/06/21.
//

import SwiftUI
import MTFoundation

struct ContentView: View {
    init() {
        MyLibrary.doSomething()
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
