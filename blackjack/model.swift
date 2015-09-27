//
//  model.swift
//  blackjack
//
//  Created by dblee on 8/10/15.
//  Copyright © 2015 dblee. All rights reserved.
//

import Foundation

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
                    cardObject.isAce = true
                    cardObject.number = 11
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
    var playerName = "Player 1"
    var isBusted = false
    var playerScore = 0
    var Aces = 0

    func showhand (isHidden:Bool = false) {
        print("\nThis is \(playerName)'s hand:\n")
            
        if isHidden == true {
            print("[Hidden]")
            for var i = 1; i < playerHand.count; ++i {
                print(playerHand[i].name)
            }
        }
        if isHidden == false {
            for i in playerHand {print(i.name)}
        }
        
    }
    
    func hit (times:Int) {
        
        
        for var i = 0; i < times; ++i {
            if deck1.deckArray.count == 0 {
                deck1.newDeck()
                deck1.shuffle()
            }
            
            playerHand.append(deck1.deckArray.removeLast())
            //print(playerHand.last!.name)
            
            if playerHand.last!.isAce {++Aces} // if there are aces, add one to the ace count
            
            playerScore += playerHand.last!.value // add the value of the most recently drawn card to the player score
            
            while playerScore > 21 && Aces > 0 { // while there are aces, subtract 10 if the playerscore ever goes over 21 ***
                playerScore = playerScore - 10
                --Aces
            }

        }
        
        if playerScore > 21 {  
            isBusted = true
            Aces = 0
        }
        
        //return playerHand.last!
    }
    
    func showScore() {
        print(playerName + "'s Score: " + String(playerScore))
    }
    
    func clearHand() {
        playerScore = 0
        Aces = 0
        playerHand.removeAll()

    }
}



