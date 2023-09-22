//
//  ProgressView.swift
//  quizApp
//
//  Created by tasneem daloun on 16/09/2023.
//
import SwiftUI

struct QuizProgressView: View {
    var progress: Double

    var body: some View {
        ProgressView(value: progress)
            .padding()
    }
}
