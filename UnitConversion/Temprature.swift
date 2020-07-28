//
//  Temprature.swift
//  UnitConversion
//
//  Created by Kevin Gutowski on 7/27/20.
//

import Foundation

class Temperature {
    var celsius: Double {
        didSet {
            self.fahrenheit = celsiusToFahrenheit(value: celsius)
            self.kelvin = celsiusToKelvin(value: celsius)
        }
    }
    var fahrenheit: Double {
        didSet {
            let celsiusValue = fahrenheitToCelsius(value: fahrenheit)
            self.celsius = celsiusValue
            self.kelvin = celsiusToKelvin(value: celsiusValue)
        }
    }
    var kelvin: Double {
        didSet {
            let celsiusValue = kelvinToCelsius(value: kelvin)
            self.celsius = celsiusValue
            self.fahrenheit = celsiusToFahrenheit(value: celsiusValue)
        }
    }
    
    init(celsius: Double) {
        self.celsius = celsius
        self.fahrenheit = celsiusToFahrenheit(value: celsius)
        self.kelvin = celsiusToKelvin(value: celsius)
    }
    
    init(fahrenheit: Double) {
        let celsius = fahrenheitToCelsius(value: fahrenheit)
        self.celsius = celsius
        self.fahrenheit = fahrenheit
        self.kelvin = celsiusToKelvin(value: celsius)
    }
    
    init(kelvin: Double) {
        let celsius = kelvinToCelsius(value: kelvin)
        self.celsius = celsius
        self.fahrenheit = celsiusToFahrenheit(value: celsius)
        self.kelvin = kelvin
    }
    
}

private func celsiusToFahrenheit(value: Double) -> Double {
    let cm = Measurement(value: value, unit: UnitTemperature.celsius)
    return cm.converted(to: UnitTemperature.fahrenheit).value
}

private func celsiusToKelvin(value: Double) -> Double {
    let cm = Measurement(value: value, unit: UnitTemperature.celsius)
    return cm.converted(to: UnitTemperature.kelvin).value
}

private func fahrenheitToCelsius(value: Double) -> Double {
    let fm = Measurement(value: value, unit: UnitTemperature.fahrenheit)
    return fm.converted(to: UnitTemperature.celsius).value
}

private func kelvinToCelsius(value: Double) -> Double {
    let km = Measurement(value: value, unit: UnitTemperature.kelvin)
    return km.converted(to: UnitTemperature.celsius).value
}
