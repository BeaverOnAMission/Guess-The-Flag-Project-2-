//
//  ContentView.swift
//  6ru5e6
//
//  Created by mac on 17.02.2022.
//

import SwiftUI
struct FlagView: View {
    var image: Image
    var body: some View {
        
            image
           .resizable()
           .frame(width:250, height:130)
           .cornerRadius( 10 )
           .shadow(color: .white, radius: 10)
        
    }
}
struct ContentView: View {
     
   
  @State  var countries = ["Andorra","Angola","UAE","Afghanistan","Antigua and Barbuda","Anguilla","Albania","Armenia","Antarctica","Argentina","American Samoa","Austria"].shuffled()
 @State   var correctAnswer = Int.random(in: 1...2)
    @State private var showingScore = false
    @State private var showingalert = false
    @State private var scoreTitle = ""
    @State private var correctscore = 0
    @State private var wrongscore = 0
    @State private var score = ""
    var body: some View {
        
        ZStack {
            LinearGradient(
                stops: [
                    .init(color: .white, location: 0),
                    
                        .init(color: .indigo, location: 0.6)
                          ],
                startPoint: .top, endPoint: .bottom
            )
                .ignoresSafeArea()
            VStack {
                     
        VStack (spacing:20){
            
            
             Spacer()
            
             Spacer()
            
             Spacer()
                     VStack {
            
                         
                         
        Text ("Tap the flag of:")
                .font(.largeTitle.weight(.heavy))
                .foregroundStyle(.secondary)
                         
                Text (countries[correctAnswer])
                             .font(.largeTitle.weight(.heavy))
                             .foregroundStyle(.secondary)
                         
                   }
            
             
            
             Spacer()
            
             Spacer()
            
             
        ForEach(0..<3 ){ number in
            Button{
                
                flagTapped(number)
            }
        label:  {
            FlagView(image: Image(countries[number]))
            
        }
           
            
        }
            
            
            
           
             Spacer()
             Spacer()
            
             Spacer()
            
             
    }
               
                 
                
                 Spacer()
            Text (score)
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
               
                
                 Spacer()
                
                 Spacer()
                
                 Spacer()
                
                 Spacer()
                
                 Spacer()
                 
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 35)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: aslQuestion)
            
        }
        message: {
            Text("Score: \(correctscore)")
        }
        .alert("GAME OVER", isPresented: $showingalert){
            Button("Restart", action: alert)
            
        }
        message: {
            Text("your FINAL score: \(correctscore)")
        }
        }.preferredColorScheme(.light)
    }
    func flagTapped(_ number : Int){
        if (correctscore+wrongscore)<7{
            
        
        if number == correctAnswer{
            scoreTitle = "Correct"
            correctscore+=1
        } else {
            scoreTitle = "Wrong, this is \(countries[number])"
        wrongscore+=1
        }
      score="Score: \(correctscore)"
        showingScore = true
        
    }
        else {
            if number == correctAnswer{
                scoreTitle = "Correct"
                correctscore+=1
            } else {
                scoreTitle = "Wrong, this is \(countries[number])"
            wrongscore+=1
            }
          score="Score: \(correctscore)"
            showingScore = true
            showingalert.toggle()
        }
    }
    func aslQuestion (){
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
        
    
    }
    func alert (){
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
        correctscore = 0
        wrongscore = 0
        score=""
        showingalert = false
        showingScore = false
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
   
