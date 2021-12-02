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
    @State var value: Double = 50
    var body: some View {
        ScrollView {
            VStack {
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
                Button(action: {
                    if(value == currentGuess) {
                        value = Double(Int.random(in: 1..<100))
                        print("You have guessed number!")
                    }
                    else {
                        if(value > currentGuess) {
                            print("Higher")
                        }
                        else {
                            print("Lower")
                        }
                    }
                    print("Button was pressed")
                }, label: {
                    Text("Submit Guess")
                })
                    .buttonStyle(.bordered)
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
