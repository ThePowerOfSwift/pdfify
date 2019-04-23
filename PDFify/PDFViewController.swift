//
//  PDFViewController.swift
//  PDFify
//
//  Created by MKHS on 4/22/19.
//  Copyright © 2019 mkhs. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {
    
    
    @IBOutlet weak var PDFOutlet: UIImageView!
    @IBOutlet weak var CountOutlet: UITextField!
    @IBOutlet weak var ShareOutlet: UIButton!
    
    var delegate: PDF?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PDFOutlet.image = delegate?.getPDF()
        CountOutlet.text = "\(delegate?.getIndex() ?? 0) / \(delegate?.getCount() ?? 0)"

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
