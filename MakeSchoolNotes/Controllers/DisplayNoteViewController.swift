//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
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
        noteTitleTextField.text = note?.title ?? ""
        noteContentTextView.text = note?.content ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            }
            else if identifier == "save" {
                let listNotesTableViewController = segue.destination as! ListNotesTableViewController
                if let note = note {
                    note.title = noteTitleTextField.text ?? ""
                    note.content = noteContentTextView.text ?? ""
                    listNotesTableViewController.tableView.reloadData()
                }
                else{
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text ?? ""
                    newNote.modificationTime = Date()
                    listNotesTableViewController.notes.append(newNote)
                }
                print("Save button tapped")
            }
        }
    }
}
