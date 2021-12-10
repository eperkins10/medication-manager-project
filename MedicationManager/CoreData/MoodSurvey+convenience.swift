//
//  MoodSurvey+convenience.swift
//  MedicationManager
//
//  Created by Ethan Perkins on 11/23/21.
//

import CoreData

extension MoodSurvey {
    @discardableResult convenience init(mentalState: String, date: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.mentalState = mentalState
        self.date = date
    }
}
