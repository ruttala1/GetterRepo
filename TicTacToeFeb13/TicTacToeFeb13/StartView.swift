//
//  ContentView.swift
//  TicTacToeFeb13
//
//  Created by Dhruv Ruttala on 2/13/23.
//

import SwiftUI

struct StartView: View {
    // state properties @State
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus:Bool
    @State private var startGame = false
    @EnvironmentObject var game:GameService
    
    var body: some View {
        
            
            VStack {
                
                Spacer()
                
                Picker("Select Game",selection: $gameType) {
                    Text("Select Game Type").tag(GameType.undetermined)
                    Text("Single Player").tag(GameType.single)
                    Text("Network Multiplayer").tag(GameType.peer)
                    Text("Computer").tag(GameType.bot)
                    
                }
                
                .padding()
                .background(RoundedRectangle(cornerRadius:10,style: .continuous).stroke(style:  StrokeStyle(lineWidth:2)).accentColor(.primary))
                
    
                Text(gameType.description)
                    .padding()
                
                VStack{
                    switch gameType{
                    case .single:
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                        
                    case .bot:
                        TextField("Your Name", text: $yourName)
                        
                    case .peer:
                        EmptyView()
                        //will fix later
                        
                    case .undetermined:
                        EmptyView()
                    } //end for switch
                } //end for vstack
                
                .textFieldStyle(.roundedBorder)
                .focused($focus)
                .frame(width: 350)
                
                Image("LightModeWelcome")
                Spacer()
                
                if gameType != .peer{
                    Button("Start Game"){
                        focus = false
                        startGame.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(
                        gameType == .undetermined ||
                        gameType == .bot && (
                            yourName.isEmpty) ||
                        gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                    )
                    
                }
                
                Spacer()
                
            }
            .padding()
            .fullScreenCover(isPresented: $startGame) {
                GameView()
            }
            .navigationTitle("Crossover")
            .inNavigationStack()
        
        }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(GameService())
    }
}
