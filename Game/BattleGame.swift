//
//  BattleGame.swift
//  Game
//
//  Created by Cat on 5/6/26.
//


import Foundation

struct BattleGame {
    var playerHealth = 100
    var enemyHealth = 50

    var enemyIsDead: Bool {
        enemyHealth <= 0
    }

    var playerIsDead: Bool {
        playerHealth <= 0
    }

    mutating func attackEnemy() {
        enemyHealth -= 10

        if enemyHealth < 0 {
            enemyHealth = 0
        }
    }

    mutating func enemyAttack() {
        playerHealth -= 15

        if playerHealth < 0 {
            playerHealth = 0
        }
    }
}