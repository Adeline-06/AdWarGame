//
//  Game.swift
//  AdWarGameProjet
//
//  Created by Adeline GIROIX on 03/08/2020.
//  Copyright © 2020 Adeline GIROIX. All rights reserved.
//

import Foundation

/// Class description
class Game {
    
    // MARK: - Global portability properties in the game
    
    ///Member description
    let gameName: String
    
    init(gameName: String) {
        self.gameName = gameName
    }
    
    // MARK: - : Main function of the game
    
    ///Main function of the game
    func mainGame() {
        
        //Game Tittle
        titleOfGame()
        
        // extensionCasting
        mainCasting()
       
        // extensionRunFight
        mainFight()
        
        // extensionEndOfGame
        endOfGame()
        
    } // end of : func mainGame() {
    
    // MARK: - Titles Start Game
    
    ///Titles Start Game
    fileprivate func titleOfGame() {
        // titles
        print("\n\(constants.LINE)")
        print("                       \(self.gameName)")
        print("\n\(constants.LINE)\n")
    }

    // MARK: - 1 - configuration of players, teams, characters

    func mainCasting() {
        
        for playerIndex in 0...constants.DEFAULT_PLAYERS_NUMBER - 1 {
            
            Game.teams.append(creationOfTeams(playerIndex: playerIndex))
            
            var anyCharacter: Character
            for characterIndex in 0...constants.DEFAULT_CHARACTERS_NUMBER - 1 {
                anyCharacter = Game.teams[playerIndex].creationCharacter(characterIndex: characterIndex)
                // to respect the concept of class responsibility
                anyCharacter.createRole()
                // to respect the concept of class responsibility
                Game.teams[playerIndex].appendNewCharacterOfTheTeam(newCharacter: anyCharacter)
                
            } //end of : for characterIndex in 0...constants.DEFAULT_CHARACTERS_NUMBER - 1 {
            
            // to respect the concept of class responsibility
            print("\n  ⌲  RECAPITULATIF DE L'EQUIPE :")
            Game.teams[playerIndex].displayTheCharacteristicsOfAllCharacterOfTheTeam()
        } // end of : for playerIndex in 0...constants.DEFAULT_PLAYERS_NUMBER {
        
    } // end of: func mainCasting() {
    
    //=======================================
    // MARK: - creation of player instances
    //=======================================
    
    func creationOfTeams(playerIndex: Int) -> Team {
        print("\n  🚹 JOUEUR NUMERO \(playerIndex+1) -> Quel sera le nom de ton équipe ? ", terminator: "")
        let returnedData = Game.choiceNames()
        return Team(gameName: gameName, teamId: playerIndex, teamName: returnedData)
    } // end of : func creationOfTeams {
    
    // MARK: - SECTION for runFight functions
    
    /// This section manages the whole "assaults" part of the game.
    /// A "while" loop will rotate until one of the 2 teams is no longer alive.
    ///
    ///
    /// - Returns the statics variables "winningTeam" and "losingTeam".
    func mainFight() {
        
        // creation of instance variables initialized by default.
        var attackingTeam: Team = Game.teams[0]
        var targetTeam: Team = Game.teams[1]
        
        var attackingCharacter: Character = Game.teams[0].characters[0]
        var targetCharacter: Character = Game.teams[1].characters[0]
        
        var winningTeam: Team = Game.teams[0]
        var losingTeam: Team = winningTeam
        
        // fight loop
        repeat {
            // assault counter
            Game.counter += 1
            // round title
            print("\n\(constants.LINE)")
            print("            ⚔️👊🏽 ASSAUT N° \(Game.counter) ⚔️👊🏽 ")
            print("\n\(constants.LINE)")
            
            // "heads or tails" for which team attacks first
            if Game.counter == 1 {
                //random team witch start lthe play randomly
                (attackingTeam, targetTeam) = attackingTeam.firstRandomRound()
            } else {
                //swap teams after first round
                (attackingTeam, targetTeam) = winningTeam.switchLosingTeamToAttackingTeam(losingTeam: losingTeam)
            }// end of :  if Game.counter == 1 {
            
            // MARK: - Choose the Attacking Character:
            
            attackingCharacter = attackingTeam.choiceOfOneTeamCharactercontext(context: "ATTAQUANTE")

            // in Case of healer choice, we have to go to a special treatment.
            if attackingCharacter.role.roleName == constants.HEALER_ROLE {
                // case of Healer, we have to go to his special treatment
                // instantiating the HealerTreatmentProcess
                let healerTreatmentProcess = HealerSection(teamConcerned: attackingTeam, teamNotConcerned: targetTeam, healerChoosen: attackingCharacter)
                // function call treatmentProcessOfTheHealer of this instance
                (winningTeam, losingTeam) = healerTreatmentProcess.treatmentProcessOfTheHealer()
            } // end of :  if attackingCharacter.role.roleName == constants.HEALER_ROLE {
            
            // if the first attacker isn't an healer with a special treatment
            if attackingCharacter.role.roleName != constants.HEALER_ROLE {
                // MARK: - Choose the Target Character:
                targetCharacter = targetTeam.choiceOfOneTeamCharactercontext(context: "ATTAQUÉE")
            } // end of : if attackingCharacter.role.roleName != constants.HEALER_ROLE {
            print("cooucou")
            // in Case of healer choice, we have to go to a special treatment.
            if targetCharacter.role.roleName == constants.HEALER_ROLE {
                // case of Healer, we have to go to his special treatment
                 /// instantiating of class HealerTreatmentProcess
                 let healerTreatmentProcess = HealerSection(teamConcerned: targetTeam, teamNotConcerned: attackingTeam, healerChoosen: targetCharacter)
                 // call of the function treatmentProcessOfTheHealer of this instance
                 (winningTeam, losingTeam) = healerTreatmentProcess.treatmentProcessOfTheHealer()
            } // end of : if targetCharacter.role.roleName == constants.GREY_ROLE
            
            // MARK: - Fight section
            
            //Run the assault func WITH THE TWO CHARACTERS selected
            if attackingCharacter.role.roleName != constants.HEALER_ROLE && targetCharacter.role.roleName != constants.HEALER_ROLE {
                
                /// instantiating of fightSection
                let fightSection = FightSection(attackingCharacter: attackingCharacter, targetCharacter: targetCharacter)
                // call of the function launchOfTheAssault of this instance
                (winningTeam, losingTeam) = fightSection.launchOfTheAssault()
            } // end of : if attackingCharacter.role.roleName != constants.HEALER_ROLE && targetCharacter.role.roleName != constants.HEALER_ROLE {

            
        } while Game.teams[0].checkIfTeamIsAlive() && Game.teams[1].checkIfTeamIsAlive()
        // run until the two teams have at least one survivor
    } // end of : func mainFight() {
    
    
    // MARK: - End of game functions
    
    ///End of the game, display fight results and stats
    func endOfGame() {
        fightResults()
        displayFightStats()
    } // end of : func endOfGame()
    
    fileprivate  func fightResults() {
        print("\n             ❌ La partie est terminée ❌\n")
        
        if  Game.teams[0].checkIfTeamIsAlive(){
            Game.winner = 0
            Game.looser = 1
        } else {
            Game.winner = 1
            Game.looser = 0
        }// end of : if  teams[0].checkIfTeamIsAlive(){
        
        print("\(constants.SUB_LINE)")
        print("     🏆🥇 L'équipe gagnante est \"\(Game.teams[Game.winner].teamName)\" en \(Game.counter) tours. 🏆🥇 \n\n     ☠️⚰️ L'équipe perdante est \(Game.teams[Game.looser].teamName) ⚰️☠️\n")
    } // end of :fileprivate  func fightResults() {
    
    fileprivate func displayFightStats() {
        
        print("\(constants.SUB_LINE)\n              🏁🏁  INVENTAIRE DES EFFECTIFS : 🏁🏁 \n")
        
        Game.teams[Game.winner].workForcesInventory()
        print("")
        Game.teams[Game.looser].workForcesInventory()
        
        print("\(constants.SUB_LINE)")
        
    } // end of : fileprivate func displayFightStats() {

    
} // end of : class Game {
