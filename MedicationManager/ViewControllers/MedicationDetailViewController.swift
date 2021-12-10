//
//  MedicationDetailViewController.swift
//  MedicationManager
//
//  Created by Ethan Perkins on 11/22/21.
//

import UIKit

class MedicationDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var medication: Medication?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let medication = medication,
           let timeOfDay = medication.timeOfDay {
            title = "Medication Details"
            nameTextField.text = medication.name
            datePicker.date = timeOfDay
        } else {
            title = "Add Medication"
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(reminderFired), name: NSNotification.Name(Strings.medicationReminder), object: nil)
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
        !name.isEmpty else { return }
        
        let timeOfDay = datePicker.date
        
        if let medication = medication {
            MedicationController.shared.updateMedication(medication: medication, name: name, timeOfDay: timeOfDay)
            
        } else {
            MedicationController.shared.create(name: name, timeOfDay: timeOfDay)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc private func reminderFired() {
        view.backgroundColor = .systemRed
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.view.backgroundColor = .systemOrange
        }
    }
    
    
    


}
