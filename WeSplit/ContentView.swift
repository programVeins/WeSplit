//
//  ContentView.swift
//  WeSplit
//
//  Created by Sabesh Bharathi on 18/06/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import SwiftUI

struct Aesthetics: View {
    @State private var amt = ""
    @State private var ppl = "1"
    @State private var tip = 1
    
    let tips = [0,5,10,15]
    
    var costPerPerson: [Double] {
        let xppl = Double(ppl) ?? 0
        let xtip = Double(tips[tip])
        let xamt = Double(amt) ?? 0
        
        let tipVal = (xamt/100) * xtip
        let totVal = xamt + tipVal
        let split = totVal/xppl
        return [totVal, split]
    }
    var body: some View {
        NavigationView {
                   Form {
                       Section {
                           TextField("Enter Total amout", text: $amt)
                               .keyboardType(.decimalPad)
                           TextField("Number of People", text: $ppl)
                               .keyboardType(.numberPad)
                           
                       }
                       Section(header: Text("How much Tip would you like to pay?")) {
                           Picker("Tip Percentage", selection: $tip) {
                               ForEach(0 ..< tips.count) {
                                   Text("\(self.tips[$0])%")
                               }
                           }
                       .pickerStyle(SegmentedPickerStyle())
                       }
                       Section(header: Text("Total Amount")) {
                           Text("$\(costPerPerson[0], specifier: "%.2f")")
                               .foregroundColor(self.tip == 0 ? .red : .black)
                       }
                       Section(header: Text("Amount per person")) {
                           Text("$\(costPerPerson[1], specifier: "%.2f")")
                       }
                    
                   }
                    
               .navigationBarTitle("Clean UI")
               }
    }
}

struct ContentView: View {
    var body: some View {
       Aesthetics()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
