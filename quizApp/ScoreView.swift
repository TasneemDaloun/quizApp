//
//  ScoreView.swift
//  quizApp
//
//  Created by tasneem daloun on 22/08/2023.
//

import SwiftUI

struct ScoreView: View {
 
    var score: Int
    var maxscore: Int
    
    var body: some View {
       
    ZStack{
        Color("mycolor")
              .edgesIgnoringSafeArea(.all)
            VStack{
                CircularProgressView(progress: CGFloat(score) / CGFloat(maxscore))
                    .frame(width: 150, height: 150)
                
                Text("Your score is")
                    .font(.title)
                    .bold()
                Text("\(score) / \(maxscore)")
                    .font(.system(size: 130))
                    .bold()
                   
            }
            .edgesIgnoringSafeArea(.all)
    }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 1, maxscore: 2)
    }
}
