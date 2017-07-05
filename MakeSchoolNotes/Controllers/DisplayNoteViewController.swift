//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Mariano Montori on 7/5/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteTitleTextField.text = note?.title ?? "New Note"
        noteContentTextView.text = note?.content ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            }
            else if identifier == "save" {
                let note = self.note ?? CoreDataHelper.createNote()
                note.title = noteTitleTextField.text ?? "New Note"
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                CoreDataHelper.saveNote()
                print("Save button tapped")
            }
        }
    }
}
