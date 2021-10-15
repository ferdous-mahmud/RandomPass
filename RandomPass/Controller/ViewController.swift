//
//  ViewController.swift
//  cppTest
//
//  Created by Ferdous Mahmud Akash on 10/13/21.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {
    
    var passLen = 10


    @IBOutlet weak var passField: UITextView!
    @IBOutlet weak var passLengthCount: UITextField!
    @IBOutlet weak var strengthButton: UIButton!
    @IBOutlet weak var strengthImage: UIImageView!
    @IBOutlet weak var darkLightToggle: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        updateDarkLightMode()
    }
    
    @IBAction func generateBtnGotPressed(_ sender: UIButton) {
        updateUI()
    }
    
    @IBAction func copyButtonGotPressed(_ sender: UIButton) {
        UIPasteboard.general.string = self.passField.text
        SCLAlertView().showSuccess("Copied", subTitle: "Password copied to clipboard")
    }
    
    @IBAction func passLengthSlider(_ sender: UISlider) {
        passLen = Int(sender.value)
        passLengthCount.text = String(passLen)
        updateUI()
    }
    
    func updateDarkLightMode(){
        if(darkLightToggle.selectedSegmentIndex == 0){
            let window = UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
            window?.overrideUserInterfaceStyle = .light
        }
        else{
            let window = UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
            window?.overrideUserInterfaceStyle = .dark
        }
    }
    
    @IBAction func darkLightToggleTapped(_ sender: UISegmentedControl) {
        updateDarkLightMode()
    }
    
    func updateUI(){
        passField.text = String(cString: randomPasswordGeneration(Int32(passLen)))
        strengthButton.layer.cornerRadius = 5
        
        switch passLen {
            case 1...4:
            strengthButton.setTitle("VERY WEAK", for: .normal)
            strengthButton.backgroundColor = UIColor(red: 243/255, green: 32/255, blue: 61/255, alpha: 1.0)
            strengthImage.image = UIImage(named: "very_weak")
            case 5...7:
            strengthButton.setTitle("WEAK", for: .normal)
            strengthButton.backgroundColor = UIColor(red: 243/255, green: 32/255, blue: 61/255, alpha: 1.0)
            strengthImage.image = UIImage(named: "weak")
            case 8...9:
            strengthButton.setTitle("GOOD", for: .normal)
            strengthButton.backgroundColor = UIColor(red: 241/255, green: 200/255, blue: 12/255, alpha: 1.0)
            strengthImage.image = UIImage(named: "good")
            case 10...11:
            strengthButton.setTitle("STRONG", for: .normal)
            strengthButton.backgroundColor = UIColor(red: 124/255, green: 228/255, blue: 149/255, alpha: 1.0)
            strengthImage.image = UIImage(named: "strong")
            default:
            strengthButton.setTitle("VERY STRONG", for: .normal)
            strengthButton.backgroundColor = UIColor(red: 44/255, green: 112/255, blue: 246/255, alpha: 1.0)
            strengthImage.image = UIImage(named: "very_strong")
        }

    }
}
