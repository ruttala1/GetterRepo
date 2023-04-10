//
//  game models.swift
//  TicTacToeFeb13
//
//  Created by Dhruv Ruttala on 2/13/23.
//

import Foundation
import SwiftUI

//enumerated data type - creates variables and gives it a number in a sequence
// enum means that there are numbers assigned to versions

enum GameType {
case single, bot, peer, undetermined
    
    var description: String {
        switch self {
        case .single:
            return "Share your device and play against a friend"
        case .bot:
            return "Play with your device"
        case .peer:
            return "Invite someone near you"
        case .undetermined:
            return ""
        }
    }
}

enum GamePiece: String{
    case x,o
    var image:Image {
        Image(self.rawValue)
    }
}

    struct Player{
        let gamePiece:GamePiece
        var name:String
        var moves:[Int] = []
        var isCurrent = false
        var isWinner:Bool {
            for moves in Moves.winningMoves{
                if moves.allSatisfy(self.moves.contains){
                    return true
                }
            }
            return false
        }
    }

enum Moves{
    static var all = [1,2,3,4,5,6,7,8,9]
    static var winningMoves = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
    ]
}
