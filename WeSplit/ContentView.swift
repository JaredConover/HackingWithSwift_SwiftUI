//
//  ContentView.swift
//  WeSplit
//
//  Created by Jared Conover on 2021-08-11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    // This is a computed property
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipPercentage = Double(tipPercentages[tipPercentage])
        let baseAmount = Double(checkAmount) ?? 0
        
        return ((tipPercentage / baseAmount * 100) + baseAmount ) / peopleCount
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).padding()
                        .keyboardType(.decimalPad)
                    
                    // Inside of a form the picker needs to be nested in a navigation view
                    // or SwiftUI wont be able to create the screen of options
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                    .padding()
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count ) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson)").padding()
                }
            }
            // This title is associated to the form instead of the navigation view because the navigation view may need to display titles for may different views
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
            .previewLayout(.device)
            .preferredColorScheme(.dark)
    }
}
