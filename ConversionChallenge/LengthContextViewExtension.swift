import SwiftUI

extension ContentView {
  
  func lengthChanged(to value: Double) {
    let formula = retrieveFormulaLengthConversion(input: lengthUnitInput, output: lengthUnitOutput)
    resultLength = formula(numberLength)
  }
  
  func retrieveFormulaLengthConversion(input: LengthUnit, output: LengthUnit) -> (Double) -> Double {
    let formula = { (num: Double) in
      switch input {
      case LengthUnit.meters:
        return convertMeters(num: num, output: output)
      case LengthUnit.kilometers:
        return convertKilometers(num: num, output: output)
      case LengthUnit.feet:
        return convertFeet(num: num, output: output)
      case LengthUnit.yard:
        return convertFeet(num: num, output: output)
      case LengthUnit.miles:
        return convertFeet(num: num, output: output)
      default:
        return -1.0
      }
    }
    
    return formula
  }
  
  func convertMeters(num: Double, output: LengthUnit) -> Double {
    if output == LengthUnit.meters {
      return num
    }
    else if output == LengthUnit.kilometers {
      return num/1000
    }
    else if output == LengthUnit.feet {
      return num * 0.3048
    }
    else if output == LengthUnit.yard {
      return num * 1.0936
    }
    else {
      return num * 0.0006213712
    }
  }
  
  func convertKilometers(num: Double, output: LengthUnit) -> Double {
    if output == LengthUnit.meters {
      return num * 1000
    }
    else if output == LengthUnit.kilometers {
      return num
    }
    else if output == LengthUnit.feet {
      return num * 304.8
    }
    else if output == LengthUnit.yard {
      return num * 1093.6
    }
    else {
      return 0
    }
  }
  
  func convertFeet(num: Double, output: LengthUnit) -> Double {
    if output == LengthUnit.meters {
      return num/0.3048
    }
    else if output == LengthUnit.kilometers {
      return num/0.0003048
    }
    else if output == LengthUnit.feet {
      return num
    }
    else if output == LengthUnit.yard {
      return num/3.0
    }
    else {
      return num * 0.0001894
    }
  }
  
  func convertYard(num: Double, output: LengthUnit) -> Double {
    if output == LengthUnit.meters {
      return 1.0936/num
    }
    else if output == LengthUnit.kilometers {
      return num/1093.6
    }
    else if output == LengthUnit.feet {
      return num * 3.0
    }
    else if output == LengthUnit.yard {
      return num
    }
    else {
      return num * 1760.0
    }
  }
  
  func convertMiles(num: Double, output: LengthUnit) -> Double {
    if output == LengthUnit.meters {
      return 0.0006213712/num
    }
    else if output == LengthUnit.kilometers {
      return 0.0000006213712/num
    }
    else if output == LengthUnit.feet {
      return num/0.0001894
    }
    else if output == LengthUnit.yard {
      return num/1760.0
    }
    else {
      return num
    }
  }
}

