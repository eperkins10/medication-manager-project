//
//  DateFormatter.swift
//  MedicationManager
//
//  Created by Ethan Perkins on 11/22/21.
//

import Foundation

extension DateFormatter {
    static let medicationTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
}
