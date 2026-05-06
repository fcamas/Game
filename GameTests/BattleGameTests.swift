//
//  BattleGameTests.swift
//  GameTests
//
//  Created by Cat on 5/6/26.
//

import XCTest
@testable import Game

final class BattleGameTests: XCTestCase {

    func testPlayerAttackDamagesEnemy() {
        var game = BattleGame()

        game.attackEnemy()

        XCTAssertEqual(game.enemyHealth, 40)
    }

    func testEnemyDiesWhenHealthReachesZero() {
        var game = BattleGame()

        game.attackEnemy()
        game.attackEnemy()
        game.attackEnemy()
        game.attackEnemy()
        game.attackEnemy()

        XCTAssertEqual(game.enemyHealth, 0)
        XCTAssertTrue(game.enemyIsDead)
    }

    func testEnemyAttackDamagesPlayer() {
        var game = BattleGame()

        game.enemyAttack()

        XCTAssertEqual(game.playerHealth, 85)
    }

    func testPlayerDiesWhenHealthReachesZero() {
        var game = BattleGame()

        game.enemyAttack()
        game.enemyAttack()
        game.enemyAttack()
        game.enemyAttack()
        game.enemyAttack()
        game.enemyAttack()
        game.enemyAttack()

        XCTAssertEqual(game.playerHealth, 0)
        XCTAssertTrue(game.playerIsDead)
    }
}
