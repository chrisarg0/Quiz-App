//
//  TriviaModel.swift
//  TrueFalseStarter
//
//  Created by Chris Argonish on 6/19/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

class Questions {
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    let answer: String
    
    init(question: String, option1: String, option2: String, option3: String, option4: String, answer: String) {
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answer = answer
    }
}

let question1 = Questions(question: "Who does Oberyn Martell seek revenge for?",
                          option1: "His wife",
                          option2: "His daughter",
                          option3: "His sister",
                          option4: "His mother",
                          answer: "His sister")

let question2 = Questions(question: "Who killed Jon Arryn?",
                          option1: "Cerci Lannister",
                          option2: "Petyr Baelish",
                          option3: "Lysa Arryn",
                          option4: "Jaime Lannister",
                          answer: "Lysa Arryn")

let question3 = Questions(question: "What signaled Khal Drogo's undefeated glory to the Dothraki?",
                          option1: "The size of his khalasar",
                          option2: "The length of his hair",
                          option3: "The paint on his chest",
                          option4: "The number of his horses",
                          answer: "The length of his hair")

let question4 = Questions(question: "Who said, 'If we die, we die. But first, we'll live'?",
                          option1: "Shae",
                          option2: "Tyrion Lannister",
                          option3: "Ygritte",
                          option4: "Bronn",
                          answer: "Ygritte")

let question5 = Questions(question: "Who says, 'The worst ones always live'?",
                          option1: "Sansa Stark",
                          option2: "Arya Stark",
                          option3: "Daenerys Targaryen",
                          option4: "Cersei Lannister",
                          answer: "Sansa Stark")

let question6 = Questions(question: "Who has never been on the small council?",
                          option1: "Olenna Tyrell",
                          option2: "Mace Tyrell",
                          option3: "Cersei Lannister",
                          option4: "Renly Baratheon",
                          answer: "Olenna Tyrell")

let question7 = Questions(question: "Who saves Sansa Stark during the riot of King's Landing?",
                          option1: "Tyrion Lannister",
                          option2: "The Hound",
                          option3: "Joffrey Baratheon",
                          option4: "Petyr Baelish",
                          answer: "The Hound")

let question8 = Questions(question: "Where is the Iron Bank?",
                          option1: "Braavos",
                          option2: "Highgarden",
                          option3: "Pyke",
                          option4: "Dorne",
                          answer: "Braavos")

let question9 = Questions(question: "What can definitely kill a White Walker?",
                          option1: "Sunlight",
                          option2: "Dragon Fire",
                          option3: "Iron",
                          option4: "Dragonglass",
                          answer: "Dragonglass")

let question10 = Questions(question: "Who is NOT on Arya Stark's list?",
                          option1: "Ilyn Payne",
                          option2: "Cersei Lannister",
                          option3: "Varys",
                          option4: "Joffrey Baratheon",
                          answer: "Varys")

var allQuestions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
