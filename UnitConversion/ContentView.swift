//
//  ContentView.swift
//  UnitConversion
//
//  Created by Kevin Gutowski on 7/27/20.
//

import SwiftUI

enum ConversionTypes {
    case Temperature
    case Length
    case Time
    case Volume
}

let tempTypes = ["Celsius", "Fahrenheit", "Kelvin"]

struct ContentView: View {
    @State var value1: String = ""
    @State var value1Type: Int = 0
    @State var value2Type: Int = 0
    
    var value2: String {
        var v1: Temperature
        switch value1Type {
        case 0:
            v1 = Temperature(celsius: Double(value1) ?? 0.0)
        case 1:
            v1 = Temperature(fahrenheit: Double(value1) ?? 0.0)
        case 2:
            v1 = Temperature(kelvin: Double(value1) ?? 0.0)
        default:
            v1 = Temperature(celsius: 0.0)
        }
            
        switch value2Type {
        case 0:
            return String(format: "%g",v1.celsius)
        case 1:
            return String(format: "%g",v1.fahrenheit)
        case 2:
            return String(format: "%g",v1.kelvin)
        default:
            return String(format: "%g",v1.celsius)
        }
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Units", selection: $value1Type) {
                    ForEach(0 ..< tempTypes.count) {
                        Text(tempTypes[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                TextField("0.0", text: $value1)
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Picker("Units", selection: $value2Type) {
                    ForEach(0 ..< tempTypes.count) {
                        Text(tempTypes[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Text("\(value2)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
