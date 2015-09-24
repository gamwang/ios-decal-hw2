//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    @IBOutlet weak var returnBUtton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var inputButton: UIButton!

    @IBOutlet var nextKeyboardButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    @IBAction func returnDown(sender: AnyObject) {
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText("\n")
    }
    @IBAction func deleteDown(sender: AnyObject) {
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText( "Deleting...")
        proxy.deleteBackward()
    }
    @IBAction func inputDown(sender: AnyObject) {
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText("writes some text on click yo!")
    }
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template\
    }


}
