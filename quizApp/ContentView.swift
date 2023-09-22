//
//  ContentView.swift
//  quizApp
//
//  Created by tasneem daloun on 18/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    let questions = [
        Question(questionTitle: "What is the capital of the UAE ", option1: "Abu Dhabi",
                 option2: "Dubai",
                 option3: "Sharjah",
                 option4: "Ajman",
                 correctOption: .one),
        Question(questionTitle: "what is the capital of Oman",
                 option1: "Salalh",
                 option2: "Muscat",
                 option3: "sahar",
                 option4: "Nazwa",
                 correctOption: .two),
        Question(questionTitle: "what is the capital of syria",
                 option1: "amman",
                 option2: "baghdad",
                 option3: "dimuscas",
                 option4: "aleppo",
                 correctOption: .three)]
    
    
    @State private var questionNum : Int = 1
    @State private var isAlert = false
    @State private var isCorrect = false
    
    @State private var numOfCorrectAns: Int = 0
    @State private var isScoreShown = false
    
    
    
    
    
    
    
    
    func didTap(optionNum: OptionChoice) {
        if optionNum == questions[questionNum - 1].correctOption {
            isCorrect = true
            print("correct option")
            numOfCorrectAns += 1
        } else {
            isCorrect = false
            print("option is wrong")
            
        }
        isAlert = true
    }
    
    func optionButton(optionNum: OptionChoice, iconName: String, colour: Color) -> some View {
        Button {
            didTap(optionNum: optionNum)
        } label: {
            Image(systemName: iconName)
            
                .foregroundColor(colour)
            switch optionNum {
            case .one:
                Text(questions[questionNum - 1].option1)
                    .padding()
                    .background(colour)
                    .foregroundColor(.white)
            case .two:
                Text(questions[questionNum - 1].option2)
                    .padding()
                    .background(colour)
                    .foregroundColor(.white)
            case .three:
                Text(questions[questionNum - 1].option3)
                    .padding()
                    .background(colour)
                    .foregroundColor(.white)
            case .four:
                Text(questions[questionNum - 1].option4)
                    .padding()
                    .background(colour)
                    .foregroundColor(.white)
            }
        }
    }
    var body: some View {
        ZStack{
         
        
            
            VStack {
             
                
                
                Text(questions[questionNum - 1].questionTitle)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .bold()
                
                
                QuizProgressView(progress: Double(questionNum - 1) / Double(questions.count))
                    .frame(maxWidth: .infinity)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                    .padding()
                HStack{
                    optionButton(optionNum: .one, iconName: "triangle.fill", colour: .red)
                    
                    optionButton(optionNum: .two, iconName: "circle.fill", colour: .blue)
                    
                }
                
                .padding()
                
                HStack{
                    optionButton(optionNum: .three, iconName: "square.fill", colour: .yellow)
                    optionButton(optionNum: .four, iconName: "diamond.fill", colour: .green)
                }
                
                
                
            }
        }
        
        .padding()
        .alert(isCorrect ? "Correct" : "Wrong", isPresented: $isAlert) {
            Button("ok")
            {
                if questionNum == questions.count{
                    isScoreShown = true
                    questionNum = 0
                }
                questionNum += 1
                
            }
        }message: {
            Text(isCorrect ? "Congrats! you are quite smart!!" : "ohhhh")
        }
        .sheet(isPresented: $isScoreShown, onDismiss: {numOfCorrectAns = 0}) {
            ScoreView(score: numOfCorrectAns, maxscore: questions.count)
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
