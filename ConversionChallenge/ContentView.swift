//
//  ContentView.swift
//  ConversionChallenge
//
//  Created by Miriam Pfaffenbach on 01.12.22.
//

import SwiftUI

struct ContentView: View {
  
  @State var temperatureUnitInput = TemperatureUnit.celsius
  @State var temperatureUnitOutput = TemperatureUnit.celsius
  
  @State var lengthUnitInput = LengthUnit.meters
  @State var lengthUnitOutput = LengthUnit.meters
  
//  @State private var timeUnitInput: String = "seconds"
//  @State private var timeUnitOutput: String = "seconds"
//
//  @State private var volumeUnit: String = "milliliters"
  
  @State var numberLength: Double = 0.0
  @State var resultLength: Double = 0.0
  
  @State var numberTemperature: Double = 0.0
  @State var resultTemperature: Double = 0.0
  
//  @State private var numberTime: Double = 0.0
//  @State private var resultTime: Double = 0.0
  
  let temperatureUnits = Array<TemperatureUnit>([TemperatureUnit.celsius, TemperatureUnit.fahrenheit, TemperatureUnit.kelvin])
  let lengthUnits = Array<LengthUnit>([LengthUnit.meters, LengthUnit.kilometers, LengthUnit.feet, LengthUnit.yard, LengthUnit.miles])
  //let timeUnits = Array<String>(["seconds", "minutes", "hours", "days"])
  //let volumeUnits = Array<String>(["milliliters", "liters", "cups", "pints", "gallons"])
  
  var body: some View {
    NavigationView {
      Form {
        Section("Temperature") {
          Picker("Input: ", selection: $temperatureUnitInput) {
            ForEach(temperatureUnits, id: \.self) {
              Text($0.rawValue)
            }
          }
          Picker("Output: ", selection: $temperatureUnitOutput) {
            ForEach(temperatureUnits, id: \.self) {
              Text($0.rawValue)
            }
          }
        }
        
        Section {
          Text("Enter a number: ")
          TextField("Number", value: $numberTemperature, format: .number)
            .keyboardType(.decimalPad)
          Text("Result: \(resultTemperature)")
        }
        .onChange(of: numberTemperature, perform: { _ in
          let formula = retrieveFormula(input: temperatureUnitInput, output: temperatureUnitOutput)
          resultTemperature = formula(numberTemperature)
        })
        
        Section("Length") {
          Picker("Input: ", selection: $lengthUnitInput) {
            ForEach(lengthUnits, id: \.self) {
              Text($0.rawValue)
            }
          }
          .pickerStyle(.segmented)
          Picker("Output:  ", selection: $lengthUnitOutput) {
            ForEach(lengthUnits, id: \.self) {
              Text($0.rawValue)
            }
          }
          .pickerStyle(.segmented)
        }
        Section {
          Text("Enter a number: ")
          TextField("Number", value: $numberLength, format: .number)
            .keyboardType(.decimalPad)
          Text("Result: \(resultLength)")
        }
        .onChange(of: numberLength, perform: { _ in
          let formula = retrieveFormulaLengthConversion(input: lengthUnitInput, output: lengthUnitOutput)
          resultLength = formula(numberLength)
        })
          
          //          Section("Time") {
          //            Picker("Input: ", selection: $timeUnitInput) {
          //              ForEach(timeUnits, id: \.self) {
          //                Text($0)
          //              }
          //            }
          //            Picker("Output: ", selection: $timeUnitOutput) {
          //              ForEach(timeUnits, id: \.self) {
          //                Text($0)
          //              }
          //            }
          //            Text("Enter a number: ")
          //            TextField("Number", value: $numberTime, format: .number)
          //              .keyboardType(.decimalPad)
          //            Text("Result: \(resultTime)")
          //          }
          
          //          Section {
          //            Picker("Volume conversion: ", selection: $volumeUnit) {
          //              ForEach(volumeUnits, id: \.self) {
          //                Text($0)
          //              }
          //            }
          //          }
        }
        .navigationTitle("Conversions")
      }
    }
  }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
