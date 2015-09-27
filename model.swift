//
//  model.swift
//  blackjack
//
//  Created by dblee on 8/10/15.
//  Copyright © 2015 dblee. All rights reserved.
//

import Foundation

var player1 = player()

var npc1 = npc()

let dealer1 = dealer()

struct card {
    
    var suit: String = "nil"
    var number: Int = 0
    var value: Int = 0
    var isAce: Bool = false
    var name: String = "nil"
    
}




class deck {
    
    
    var deckArray = [card]()
    var suitArray = ["Hearts", "Diamonds", "Clubs", "Spades"]
    var cardArray = ["Ace", "2", "3", "4", "5", "6","7","8","9","10","Jack","Queen","King"]
    
    //build a new deck!
    
    init() {
        
        newDeck()
        
        shuffle()
    }
    
    func newDeck () {
        print("Building a new deck!")
        for x in suitArray {
            for i in cardArray {
                var cardObject = card()
                cardObject.suit = x
                cardObject.name = i + " of " + x
                switch i {
                case "Ace":
                    cardObject.number = 11
                    cardObject.isAce = true
                    cardObject.value = 11
                case "Jack":
                    cardObject.number = 10
                    cardObject.value = 10
                case "Queen":
                    cardObject.number = 10
                    cardObject.value = 10
                case "King":
                    cardObject.number = 10
                    cardObject.value = 10
                default:
                    cardObject.number = Int(i)!
                    cardObject.value = Int(i)!
                }
                deckArray.append(cardObject)
            }
            
        }
    }
    
    //now shuffle!
    func shuffle() {
        print("Shuffling deck!")
        for var i = deckArray.count - 1; i > 0; i-- {
            
            let j = Int(arc4random_uniform(UInt32(i - 1)))
            // print((deckArray[j]))
            swap(&deckArray[i], &deckArray[j])
        }
    }
    
    
    
}

/*for debugging only! */
//let deck1 = deck()
//
//for i in deck1.deckArray {
//    print(i.name)
//}

class player {
 
    var playerHand = [card]()
    var isHuman = true
    var playerName = "Player 1"

    func hit (times:Int) -> card {
        
        for var index = 0; index < times; ++index {
            if deck1.deckArray.count == 0 {
                deck1.newDeck()
                deck1.shuffle()
            }
            playerHand.append(deck1.deckArray.removeLast())
            print(playerHand.last!)
        }
        return playerHand.last!
    }


    func showhand () {
        print("\nThis is \(playerName)'s hand:\n")
        
        if isHuman == true {
            for i in playerHand {
            
                print(i.name)
            }
        }
        
        else {
            for var i = 1; i < playerHand.count; ++i {
                print(playerHand[i])
            }
            
        }
    }

}


//class player{
//    
//    let isHuman = true
//    var playerHand = [String]()
//    var currentScore = 0
//    
//    init() {
//        
//        print("Player 1 intiated! Deal me some cards!")
//        for _ in 0...1 {self.hitMe()}
//        
//        //print("My cards are \(playerHand)")
//    }
//    
//    //add the drawn card to the player hand
//    func hitMe() {
//        playerHand.append(deck1.draw())
//        //print("My cards are \(playerHand)")
//    }
//    
//    
//}
//
//class npc {
//    
//    let isHuman = false
//    var npcHand = [String]()
//    var currentScore = 0
//
//    init() {
//        
//        print("Dealer 1 intiated! Deal me some cards!")
//        for _ in 0...1 {self.hitMe()}
//        print("My cards are \(npcHand)")
//    }
//    
//    //add the drawn card to the dealer hand
//    func hitMe() {
//        npcHand.append(deck1.draw())
//        print("My cards are \(npcHand)")
//    }
//    
//}
//



