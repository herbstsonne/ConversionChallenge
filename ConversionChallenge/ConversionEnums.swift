//
//  ConversionEnums.swift
//  ConversionChallenge
//
//  Created by Miriam Pfaffenbach on 02.12.22.
//

import SwiftUI

public enum TemperatureUnit: String, CaseIterable {
  case celsius = "Celsius"
  case fahrenheit = "Fahrenheit"
  case kelvin = "Kelvin"
}

public enum LengthUnit: String, CaseIterable {
  case meters = "meters"
  case kilometers = "kilometers"
  case feet = "feet"
  case yard = "yard"
  case miles = "miles"
}
