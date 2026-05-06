//
//  ContentView.swift
//  Game
//
//  Created by Cat on 5/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var playerHealth = 100
    @State private var enemyHealth = 50
    @State private var message = "Fight started!"

    var enemyIsDead: Bool {
        enemyHealth <= 0
    }

    var playerIsDead: Bool {
        playerHealth <= 0
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Simple Battle Game")
                .font(.largeTitle)
                .bold()

            VStack(spacing: 10) {
                Text("Player Health: \(playerHealth)")
                    .font(.title2)

                Text("Enemy Health: \(max(enemyHealth, 0))")
                    .font(.title2)
            }

            Text(message)
                .font(.headline)
                .padding()

            Button("Attack Enemy") {
                attackEnemy()
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
            .disabled(enemyIsDead || playerIsDead)

            Button("Enemy Attacks Player") {
                enemyAttack()
            }
            .font(.title2)
            .buttonStyle(.bordered)
            .disabled(enemyIsDead || playerIsDead)

            Button("Restart Game") {
                restartGame()
            }
            .font(.title2)
        }
        .padding()
    }

    func attackEnemy() {
        enemyHealth -= 10

        if enemyHealth <= 0 {
            enemyHealth = 0
            message = "Enemy died!"
        } else {
            message = "Enemy took 10 damage!"
        }
    }

    func enemyAttack() {
        playerHealth -= 15

        if playerHealth <= 0 {
            playerHealth = 0
            message = "Player died!"
        } else {
            message = "Player took 15 damage!"
        }
    }

    func restartGame() {
        playerHealth = 100
        enemyHealth = 50
        message = "Fight restarted!"
    }
}

#Preview {
    ContentView()
}
