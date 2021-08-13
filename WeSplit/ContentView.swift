//
//  ContentView.swift
//  WeSplit
//
//  Created by Jared Conover on 2021-08-11.
//

import SwiftUI

struct ContentView: View {
    
    // A property wrapper is used so we can modify the struct
    // @State is a property wrapper recommended for simple properties that exist
    // in only one view so we add the private access modifier
    @State private var tapCount = 0
    
    var body: some View {
        
        // Navigation view stops elements from scrolling behind system ui (clock, etc)
        NavigationView {
            
            Form {
                
                Section {
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                
                // We cannot add more than 10 elements to each group
                Group {
                    Text("Hello, world!").padding()
                    Text("Hello, world!").padding()
                    Text("Hello, world!").padding()
                }
                
                // A section behaves like a group but with added visual seperation
                Section {
                    Text("Goodbye, world!").padding()
                    Text("Goodbye, world!").padding()
                    Text("Goodbye, world!").padding()
                }
            }
            
            // Setting nav title inline puts title inside nav bar
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
