import SwiftUI

extension ContentView {
  
  func temperatureChanged(to value: Double) {
    let formula = retrieveFormula(input: temperatureUnitInput, output: temperatureUnitOutput)
    resultTemperature = formula(numberTemperature)
  }
  func retrieveFormula(input: TemperatureUnit, output: TemperatureUnit) -> (Double) -> Double {
    
    let formula = { (num: Double) in
      switch input {
      case TemperatureUnit.celsius:
        return convertCelsius(num: num, output: output)
      case TemperatureUnit.fahrenheit:
        return convertFahrenheit(num: num, output: output)
      case TemperatureUnit.kelvin:
        return convertKelvin(num: num, output: output)
      default:
        return -1.0
      }
    }
    
    return formula
  }
  
  func convertCelsius(num: Double, output: TemperatureUnit) -> Double {
    if output == TemperatureUnit.celsius {
      return num
    }
    else if output == TemperatureUnit.fahrenheit {
      return (num * 9/5) + 32
    }
    
    else {
      return num + 273.15
    }
  }
  
  func convertFahrenheit(num: Double, output: TemperatureUnit) -> Double {
    if output == TemperatureUnit.celsius {
      return (num - 32) * 5/9
    }
    else if output == TemperatureUnit.fahrenheit {
      return num
    }
    else {
      return num - 273.15
    }
  }
  
  func convertKelvin(num: Double, output: TemperatureUnit) -> Double {
    if output == TemperatureUnit.celsius {
      return (num - 32) * 5/9
    }
    else if output == TemperatureUnit.fahrenheit {
      return (num * 9/5) + 32
    }
    else {
      return num
    }
  }
}
