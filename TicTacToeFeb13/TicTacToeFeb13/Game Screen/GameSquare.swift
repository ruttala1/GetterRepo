//
//  GameSquare.swift
//  TicTacToeFeb13
//
//  Created by Dhruv Ruttala on 2/22/23.
//

import SwiftUI

struct GameSquare{
    var id:Int //this is to track tiles 1 through 9
    var player:Player?
    var image:Image{
        if let player = player{
            return player.gamePiece.image
        }
        else{
            return Image("None")
        }
    }//end of image
    
    static var reset:[GameSquare]{
        var squares:[GameSquare]()
        for index in 1...9{
            squares.append(GameSquare(id:index))
        }
        return squares
    }
} //end of struct
