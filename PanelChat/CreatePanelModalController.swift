//
//  CreatePanelModalController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
class CreatePanelModalController : UIViewController{
    
    @IBOutlet weak var NewHashTag: UITextField!
    
    @IBOutlet weak var NewComment: UITextView!
    @IBOutlet weak var FaceBookBtn: UISwitch!
    @IBOutlet weak var TwitterBtn: UISwitch!
    @IBOutlet weak var EmailBtn: UISwitch!
    @IBOutlet weak var SubmitBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
           self.navigationController?.setToolbarHidden(false, animated: true)
    }
}