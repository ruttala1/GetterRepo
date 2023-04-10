//
//  GameView.swift
//  TicTacToeFeb13
//
//  Created by Dhruv Ruttala on 2/15/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game:GameService
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            if [game.player1.isCurrent, game.player2.isCurrent].allSatisfy { $0 == false }{
                Text("Select a player to begin.")
            }
            HStack{
                Button(game.player1.name){
                    game.player1.isCurrent = true
                }
                .buttonStyle(PlayerButtonStyle(isCurrent: game.player1.isCurrent))
                
                
                Button(game.player2.name){
                    game.player2.isCurrent = true
                }
                .buttonStyle(PlayerButtonStyle(isCurrent: game.player2.isCurrent))
                
            }
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing)
            {
                Button("End Game") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Crossover")
        .inNavigationStack()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameService())
    }
}


struct PlayerButtonStyle:ButtonStyle{
    let isCurrent:Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8).fill(isCurrent ? Color.green:Color.gray))
            .foregroundColor(.white)
    }
    
}
