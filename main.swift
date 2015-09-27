//
//  main.swift
//  blackjack
//
//  Created by dblee on 8/10/15.
//  Copyright © 2015 dblee. All rights reserved.
//

import Foundation


print("Welcome to Blackjack!")
var deck1 = deck()

func prompt (){
//takes user input, performs function
    
    print("Please type your command:")
    
    if let input = readLine() {

        switch input {
        
            case"deal":
            print(dealer1.handArray)

            case "hit":
            player1.hitMe()
            print(player1.playerHand)
            
            case "help":
            print("you typed help")
            
            case "reshuffle":
            print("reshuffling!")
            
            case ("quit"):
            print("okay, goodbye!")
            run = false
            
            default:
            print("what?")
        }

    }

}

var run = true

while run == true {
prompt()
}
