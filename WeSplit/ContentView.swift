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
    
    var totalWithTip: Double {
        let baseAmount = Double(checkAmount) ?? 0
        let tipPercentage = Double(tipPercentages[tipPercentage])
        return (baseAmount / 100 * tipPercentage) + baseAmount
    }
    
    // This is a computed property
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return totalWithTip / peopleCount
        //        return (( baseAmount / 100 * tipPercentage) + baseAmount ) / peopleCount
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).padding()
                        .keyboardType(.decimalPad)
                    
//                    Button("Submit") {
//                        print("Tip: \(tipAmount)")
//                        hideKeyboard()
//                    }
                    
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
                
                Section(header: Text("Total amount with tip")) {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            // This title is associated to the form instead of the navigation view because the navigation view may need to display titles for may different views
            .navigationTitle("WeSplit")
        }
    }
}

// This is for hiding the keyboard, but I cant find a place to call it
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}
