//
//  InfoPageViewController.swift
//  RandomPass
//
//  Created by Ferdous Mahmud Akash on 10/15/21.
//

import UIKit

class InfoPageViewController: UIViewController {

    @IBOutlet weak var footerLinkText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTextView()
    }
    
    func updateTextView(){
        let path              = "https://github.com/ferdous-mahmud"
        let text              = footerLinkText.text ?? ""
        let attributedString  = NSMutableAttributedString.makeHyperLink(for: path, in: text, as: "Ferdous.")
        
        let font      = footerLinkText.font
        let textColor = footerLinkText.textColor
        footerLinkText.attributedText = attributedString
        footerLinkText.font      = font
        footerLinkText.textColor = textColor
    }

}

//MARK: - Making HyperLink

extension NSAttributedString{
    static func makeHyperLink(for path: String, in string: String, as subString: String) -> NSAttributedString{
        
        let nsString         = NSString(string: string)
        let subStringRange   = nsString.range(of: subString)
        let attributedString = NSMutableAttributedString(string: string)
        
        attributedString.addAttribute(.link, value: path, range: subStringRange)
        return attributedString
    }
}
