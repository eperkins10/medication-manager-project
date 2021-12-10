//
//  MoodSurveyViewController.swift
//  MedicationManager
//
//  Created by Ethan Perkins on 11/23/21.
//

import UIKit

protocol MoodSurveyViewControllerDelegate: class {
    func moodButtonTapped(with emoji: String)
}

class MoodSurveyViewController: UIViewController {

    weak var delegate: MoodSurveyViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(reminderFired), name: NSNotification.Name(Strings.medicationReminder), object: nil)
    }
    

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emojiTapped(_ sender: UIButton) {
        guard let emoji = sender.titleLabel?.text else { return }
    delegate?.moodButtonTapped(with: emoji)
 
    }
    
    @objc private func reminderFired() {
        view.backgroundColor = .systemRed
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.view.backgroundColor = .systemPurple
        }
    }
    

}
