//
//  ContentView.swift
//  WeSplit
//
//  Created by Dhruva Jothik Byrapatna on 5/16/25.
//

import SwiftUI

//gh test

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused:Bool
    let tipPercentages = [10,15,18,20,25,0]
    var totalPerCheck: Double{
       
        let tipSelection = Double(tipPercentage)
        
        return checkAmount*(1+(tipSelection/100))
    }
    var totalPerPerson: Double{
        let peopleCount = Double(numPeople+2)
        let tipSelection = Double(tipPercentage)
        
        return checkAmount*(1+(tipSelection/100))/peopleCount
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value:$checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                Picker("Number of People", selection:$numPeople ){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.navigationLink)
                
                Section("How much tip do you want to leave?"){
                    
                    Picker("Tip Percentage", selection:$tipPercentage){
                        ForEach(0..<101){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                Section("Total Check Amount") {
                    Text(totalPerCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
