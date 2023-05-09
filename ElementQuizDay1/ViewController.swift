//
//  ViewController.swift
//  ElementQuizDay1
//
//  Created by Nidhin Nishanth on 5/9/23.
//

import UIKit

//MARK: Mode Enum
enum Mode {
    case flashCard
    case quiz
}

//MARK: State Enum
enum State {
    case question
    case answer
}


// MARK: viewController Class
class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var modeSelector: UISegmentedControl!
    
    @IBOutlet var textField: UITextField!
    
    
    //MARK: Variables and Constants
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0
    
    var mode: Mode = .flashCard
    var state: State = .question
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

     // MARK: Actions
    
    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
        }
        
        state = .question
        
        updateUI()
    }
    
    
    
    //MARK: Functions
    func updateUI() {
        switch mode {
        case .flashCard:
            updateFlashCardUI()
        case .quiz:
            updateQuizUI()
        }
    }
    
    func updateQuizUI() {
        
    }
    
    func updateFlashCardUI() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        if state == .answer {
            answerLabel.text = elementName
        } else {
            answerLabel.text = "?"
        }
    }

}

