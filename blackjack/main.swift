//
//  main.swift
//  blackjack
//
//  Created by dblee on 8/10/15.
//  Copyright © 2015 dblee. All rights reserved.
//

import Foundation


print("Welcome to Blackjack!\n")
var deck1 = deck()
var player1 = player()
var dealer1 = player()
dealer1.playerName = "the dealer"

func clearall(){
    dealer1.clearHand()
    player1.clearHand()
}

func deal (){
    player1.isBusted = false
    dealer1.isBusted = false
    clearall()
    dealer1.hit(2)
    player1.hit(2)
}

func prompt (){
//takes user input, performs function
    
    print("Please type your command (deal / hit / stay / reshuffle / quit):")
    
    if let input = readLine() {
        
        //print("You typed \(input)")

        switch input {
        
            case"deal":
                print("DEALING NEW CARDS! LET'S PLAY!!")
                clearall()
                deal()
                dealer1.showhand(true)
                dealer1.showScore() //remove later
                player1.showhand()
                player1.showScore()
                if player1.playerScore == 21 && dealer1.playerScore < 21 {print("\n*** BLACKJACK!!! YOU WIN!!! ***\n")}
                if dealer1.playerScore == 21 && player1.playerScore < 21 {print("\n*** Dealer gets BLACKJACK!!! YOU LOSE!!! ***\n")}
                if dealer1.playerScore == 21 && player1.playerScore == 21 {print("\n*** BLACKJACK ALL AROUND!!! YOU PUSH! ***")}

            case "hit":
                player1.hit(1)
                if player1.isBusted == false && dealer1.isBusted == false && dealer1.playerScore < 17 {
                    dealer1.hit(1)
                }
                if player1.isBusted == true {
                    dealer1.showhand(false)
                    dealer1.showScore()
                    player1.showhand()
                    player1.showScore()
                    print("\n*** Player Busted ***")
                    clearall()
                    break
                }
                if dealer1.isBusted == true {
                    dealer1.showhand(false)
                    dealer1.showScore()
                    player1.showhand()
                    player1.showScore()
                    print("\n*** Dealer Busted, you win! ***")
                    clearall()
                    break
                }
                if player1.playerScore == 21 && dealer1.playerScore < 21 {
                    dealer1.showhand(false)
                    dealer1.showScore()
                    player1.showhand()
                    player1.showScore()
                    print("\n*** BLACKJACK!!! YOU WIN!!! ***\n")
                    clearall()
                    break
                }
                else {
                    dealer1.showhand(true)
                    dealer1.showScore()
                    player1.showhand(false)
                    player1.showScore()
                }
            
            case "stay":
                while !player1.isBusted && !dealer1.isBusted && dealer1.playerScore < 17 {dealer1.hit(1)}
                
                dealer1.showhand(false)
                dealer1.showScore() //remove later
                player1.showhand()
                player1.showScore()
                
                if dealer1.isBusted == true {
                    print("\n*** Dealer Busted, you win! ***")
                    clearall()
                }
                if player1.playerScore == 21 && dealer1.playerScore < 21 {
                    print("\n*** BLACKJACK!!! YOU WIN!!! ***\n")
                    clearall()
                }
                if player1.playerScore < 21 && player1.playerScore < dealer1.playerScore && !dealer1.isBusted {
                    print("\n***You Lose!***")
                    clearall()
                }
                else if player1.playerScore > dealer1.playerScore && !player1.isBusted {
                    print("\n***You Win!***")
                    clearall()
                }
                else if player1.playerScore == dealer1.playerScore && !dealer1.isBusted && !player1.isBusted {
                    print("\n***Push!***")
                    clearall()
                }
            
            case "help":
                print("you typed help")
            
            case "reshuffle":
                print("reshuffling!")
                clearall()
                deck1.newDeck()
                deck1.shuffle()
            
            case ("quit"):
                print("\nokay, goodbye!\n")
                run = false
                
            default:
                print("what?")
                // for debugging, remove later
                dealer1.showhand()
                dealer1.showScore()
                player1.showhand()
                player1.showScore()
        }

    }

}

var run = true

while run == true {
prompt()
}
