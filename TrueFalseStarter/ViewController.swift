//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
import QuartzCore

class ViewController: UIViewController {
    
    let questionsPerRound = allQuestions.count
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var name = "Chris"
    
    let normalButton = UIColor(red:0.05, green:0.43, blue:0.55, alpha:1.0)
    
    var gameSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var correctIncorrectResponse: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start game
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        
        buttonOne.backgroundColor = normalButton
        buttonTwo.backgroundColor = normalButton
        buttonThree.backgroundColor = normalButton
        buttonFour.backgroundColor = normalButton
        
        buttonOne.userInteractionEnabled = true
        buttonTwo.userInteractionEnabled = true
        buttonThree.userInteractionEnabled = true
        buttonFour.userInteractionEnabled = true
        
        // button design change
        buttonOne.layer.cornerRadius = 10
        buttonOne.clipsToBounds = true
        buttonTwo.layer.cornerRadius = 10
        buttonTwo.clipsToBounds = true
        buttonThree.layer.cornerRadius = 10
        buttonThree.clipsToBounds = true
        buttonFour.layer.cornerRadius = 10
        buttonFour.clipsToBounds = true
        playAgainButton.layer.cornerRadius = 10
        playAgainButton.clipsToBounds = true
        
        if questionsAsked <= questionsPerRound {
            questionsAsked += 1
            
            for _ in allQuestions {
            
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(allQuestions.count)
            
            let questionDictionary = allQuestions[indexOfSelectedQuestion]
                
            // set values for question and buttons
            questionField.text = questionDictionary.question
            correctIncorrectResponse.hidden = true
            buttonOne.setTitle(questionDictionary.option1, forState: UIControlState.Normal)
            buttonTwo.setTitle(questionDictionary.option2, forState: UIControlState.Normal)
            buttonThree.setTitle(questionDictionary.option3, forState: UIControlState.Normal)
            buttonFour.setTitle(questionDictionary.option4, forState: UIControlState.Normal)
            playAgainButton.hidden = true
            }
        }
    }
    
    func displayScore() {
        // Hide the answer buttons
        questionField.hidden = true
        buttonOne.hidden = true
        buttonTwo.hidden = true
        buttonThree.hidden = true
        buttonFour.hidden = true
        
        // Display play again button
        correctIncorrectResponse.hidden = false
        playAgainButton.hidden = false
        
        correctIncorrectResponse.font = UIFont (name: "HelveticaNeue-Bold", size: 30)
        correctIncorrectResponse.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        
        let selectedQuestionDict = allQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.answer
        
        allQuestions.removeAtIndex(indexOfSelectedQuestion)
        
        buttonOne.userInteractionEnabled = true
        buttonTwo.userInteractionEnabled = true
        buttonThree.userInteractionEnabled = true
        buttonFour.userInteractionEnabled = true
        
        if sender.titleLabel!.text == correctAnswer {

            correctQuestions += 1
            correctIncorrectResponse.hidden = false
            correctIncorrectResponse.font = UIFont (name: "HelveticaNeue-Bold", size: 20)
            correctIncorrectResponse.text = "Correct!"
            correctIncorrectResponse.textColor = UIColor(red:0.00, green:0.54, blue:0.49, alpha:1.0)

            sender.titleLabel?.textColor = UIColor.whiteColor()
            loadNextRoundWithDelay(seconds: 2)
        } else {
            
            correctIncorrectResponse.hidden = false
            correctIncorrectResponse.font = UIFont (name: "HelveticaNeue-Bold", size: 15)
            correctIncorrectResponse.text = "Sorry, wrong answer!\nThe answer is '\(correctAnswer)'."
            correctIncorrectResponse.textColor = UIColor.orangeColor()
            loadNextRoundWithDelay(seconds: 2)
        }
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        questionField.hidden = false
        buttonOne.hidden = false
        buttonTwo.hidden = false
        buttonThree.hidden = false
        buttonFour.hidden = false
        
        correctIncorrectResponse.hidden = true
        playAgainButton.hidden = true

        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

