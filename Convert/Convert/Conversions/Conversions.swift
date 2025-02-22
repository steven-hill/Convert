//
//  Conversions.swift
//  Convert
//
//  Created by Steven Hill on 20/02/2025.
//

import Foundation

enum ConversionType: String, CaseIterable {
    case distance = "Distance"
    case duration = "Duration"
    case mass = "Mass"
    case temperature = "Temperature"
    case volume = "Volume"
    
    var units: [Dimension] {
        switch self {
        case .distance:
            return [UnitLength.astronomicalUnits, UnitLength.centimeters, UnitLength.feet, UnitLength.inches, UnitLength.kilometers, UnitLength.lightyears, UnitLength.meters, UnitLength.miles, UnitLength.millimeters, UnitLength.parsecs, UnitLength.yards]
        case .duration:
            return [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
        case .mass:
            return [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds, UnitMass.stones, UnitMass.metricTons]
        case .temperature:
            return [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
        case .volume:
            return [UnitVolume.bushels, UnitVolume.cubicFeet, UnitVolume.cups, UnitVolume.fluidOunces, UnitVolume.gallons, UnitVolume.liters, UnitVolume.milliliters, UnitVolume.pints, UnitVolume.quarts, UnitVolume.tablespoons, UnitVolume.teaspoons]
        }
    }
}

struct Conversions {
    let conversions: [(type: ConversionType, units: [Dimension])] = ConversionType.allCases.map { ($0, $0.units) }
}
