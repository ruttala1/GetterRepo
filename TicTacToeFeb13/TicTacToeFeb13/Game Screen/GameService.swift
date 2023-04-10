//
//  GameService.swift
//  TicTacToeFeb13
//
//  Created by Dhruv Ruttala on 2/20/23.
//

import Foundation

@MainActor

class GameService:ObservableObject{
    @Published var player1 = Player (gamePiece: .x, name: "Player 1")
    @Published var player2 = Player (gamePiece: .o, name: "Player 2")
    @Published var possibleMoves = Moves.all
    @Published var movesTaken = [Int]()
    @Published var gameOver = false
    
    var gameType = GameType.single
    
    var currentPlayer:Player{
        if player1.isCurrent{
            return player1
        }
        else {
            return player2
        }
    }
    
    var gameStarted:Bool{
        player1.isCurrent || player2.isCurrent
        //this can also be done with an if & else return statement
    }
    var boardDisables:Bool{
        gameOver || !gameStarted
    }
    
    func setupGame(gameType: GameType, player1Name: String, player2Name: String){
        switch gameType{
        case .single:
            self.gameType = .single
            player2.name = player2Name
            
        case .bot:
            self.gameType = .bot
            
        case .peer:
            self.gameType = .peer
            
        case .undetermined:
    
            break
        }
    }
    

func reset(){
    player1.isCurrent = false
    player2.isCurrent = false
    player1.moves.removeAll()
    player2.moves.removeAll()
    gameOver = false
    possibleMoves = Moves.all
}
}
