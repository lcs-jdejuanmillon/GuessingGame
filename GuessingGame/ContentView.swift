//
//  ContentView.swift
//  GuessingGame
//
//  Created by Jacobo de Juan Millon on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    // The ccurrent guess of the user
    @State var currentGuess: Double = 50
    
    // The target that we are trying to guess
    // Will produce an integer in the range 1 to 100, inclusive
    @State var target = Int.random(in: 1...100)
    
    @State var feedback = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Slider(value: $currentGuess,
                       in: 0...100,
                       step: 1,
                       label: {
                    Text("Opacity")
                },
                       minimumValueLabel: {
                    Text("0")
                },
                       maximumValueLabel: {
                    Text("100")
                })
                Text("\(String(format: "%.0f", currentGuess))")
                    .font(.title)
                    .bold()
                Text("The super secret value is \(target)")
                Button(action: {
                    
                    //Make the user's guess into an integer
                    let currentGuessAsInteger = Int(currentGuess)
                    
                    //Compare the user's current guess to the target
                    
                    if target == currentGuessAsInteger {
                        target = Int.random(in: 1...100)
                        feedback = "You got it!"
                    }
                    else {
                        if target > currentGuessAsInteger {
                            feedback = "Guess higher next time!"
                        }
                        else {
                            feedback = "Guess lower next time"
                        }
                    }
                    print("Button was pressed")
                }, label: {
                    Text("Submit Guess")
                })
                    .buttonStyle(.bordered)
                Text(feedback)
            }
        }
        .padding()
        .navigationTitle("Guessing Game")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
