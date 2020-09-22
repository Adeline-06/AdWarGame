//
//  Team.swift
//  AdWarGameProjet
//
//  Created by Adeline GIROIX on 03/08/2020.
//  Copyright © 2020 Adeline GIROIX. All rights reserved.
//

import Foundation

class Team {
    
    // MARK: - Properties and initialization
  
    let gameName: String
    
    let teamId:Int
    let teamName: String
    
    var characters: [Character] = []
    
    init(gameName: String, teamId: Int, teamName: String) {
        self.gameName = gameName
        self.teamId = teamId
        self.teamName = teamName
    } // end of : init 
    
    // MARK: - Create characters for each team
    
    /// Setting Teams
    func creationCharacter(characterIndex: Int) -> Character {
        print("\n   ▶️ Équipe \(self.teamName)  :  Choix des 3 combattants  \n")
        print("     🔻 Combattant N° \(characterIndex + 1) : \n")
        print("      Quel est ton nom ? ", terminator: "")
        let returnedData = Game.choiceNames()
        return Character(gameName: self.gameName, teamId: self.teamId, teamName: self.teamName, characterId: characterIndex, characterName: returnedData)
    } // end of : func creationCharacter(characterIndex: Int) -> Character {

    
    func appendNewCharacterOfTheTeam(newCharacter: Character) {
        self.characters.append(newCharacter)
    } // end of : func appendNewCharacterOfTheTeam(newCharacter: Character) {

    
    func displayTheCharacteristicsOfAllCharacterOfTheTeam() {
        print("\n   Équipe numéro \"\(teamId + 1)\" - \"\(teamName)\"\n")
        for characterIndex in 0 ... constants.DEFAULT_CHARACTERS_NUMBER-1 {
            let sign = characters[characterIndex].role.roleWeapon.effect > 0 ? "+" : ""
            print("  \(characterIndex+1) : \"\(characters[characterIndex].characterName)\" - \"\(characters[characterIndex].role.roleName)\" - \(characters[characterIndex].role.life)\\\(characters[characterIndex].role.maxLife)💊 points de vie - \"\(characters[characterIndex].role.roleWeapon.weaponName)\" - impact 💥: \(sign)\(characters[characterIndex].role.roleWeapon.effect) points de vie pour la victime.")
        }// end of :  for characterIndex in 0 ... constants.DEFAULT_CHARACTERS_NUMBER - 1 {
        print("")
    } // end of : func displayTheCharacteristicsOfAllCharacterOfTheTeam() {

    // MARK: - Select Character for fight
    
    ///Select Character for fight
    fileprivate func characterSelection(context: String) -> Character {
        
        var characterChoosen: Character = characters[0]
        var choiceIsOk: Bool = true
        
        repeat {
            print("\n  🔹 Quel personnage de votre équipe choisissez-vous ? ", terminator: "")
            if let inputChoice = readLine() {
                if inputChoice == "1" || inputChoice == "2" || inputChoice == "3" {
                    guard let intInputChoice = Int(inputChoice) else { fatalError() }
                    let index = intInputChoice - 1
                    characterChoosen = self.characters[index]
                    choiceIsOk = characterChoosen.role.life > 0
                    if choiceIsOk == false  {
                        print ("  ⛔️ \(characterChoosen.characterName) est éliminé 💀, choisissez un autre combattant !")
                    }
                }else{
                    choiceIsOk = false
                    print("  ⛔️ Erreur! Vous devez saisir un chiffre entre  \"1\" et \"\(characters.count)\". Essayez à nouveau!")
                } // end of : if inputChoice == "1" || inputChoice == "2" || inputChoice == "3" {
            }// end of : if let choice = readLine()
        } while choiceIsOk == false // end of : repeat {
        
        
        print("\n  ✅ L'équipe numéro \"\(self.teamId+1)\" - \"\(self.teamName)\", \(context), a choisi comme combattant :\n ")
        characterChoosen.displayTheCharacteristicsOfOneCharacterOfTheTeam()
        return characterChoosen
    } // end of : fileprivate func characterSelection(context: String) -> Character {

    
    // MARK: - Check Team is still alive
    
    ///Check Team is still alive
    func checkIfTeamIsAlive() -> Bool {
        var cumulLife: Int = 0
        characters.forEach { (character) in
            cumulLife += character.role.life > 0 ? 1 : 0
        }
        return cumulLife > 0 ? true : false
    } // end of : func checkIfTeamIsAlive() -> Bool {

    
    
    // MARK: - Display Status Team ( end of game)
    
    func workForcesInventory() {
        print("    ▶︎ Équipe numéro \"\(self.teamId+1)\" - \"\(self.teamName)\" :\n")
        for index in 0...constants.DEFAULT_CHARACTERS_NUMBER - 1 {
            print("    \(index + 1) : \(characters[index].characterName) - \(characters[index].role.roleName) - Capital vie : \( characters[index].role.life) sur \( self.characters[index].role.maxLife) points de vie alloués.")
        } // end of : for index in 0...constants.DEFAULT_CHARACTERS_NUMBER - 1 {
        print("")
    } // end of : func workForcesInventory() {

    
    
    func choiceOfOneTeamCharactercontext(context: String) -> Character {
        
        self.displayTheCharacteristicsOfAllCharacterOfTheTeam()
        
        let returnedCharacter = self.characterSelection(context: context)
        
        return returnedCharacter
    } // end of :     func choiceOfOneTeamCharactercontext(context: String) -> Character {

    // MARK: - First Random Round
    
    /// random event : which team start the first round of the fight ?
    func firstRandomRound() -> (Team, Team){
        // counter n°1
        var local_attackingTeam: Team
        var local_targetTeam: Team
        
        let randomValue = Bool.random()
        switch randomValue {
        case true:
            local_attackingTeam = Game.teams[0]
            local_targetTeam = Game.teams[1]
        case false:
            local_attackingTeam = Game.teams[1]
            local_targetTeam = Game.teams[0]
        } // end of: switch randomValue {

        print("\n 👮🏽‍♂️🎲 Le hasard à désigné l'équipe numéro \(local_attackingTeam.teamId+1) - \(local_attackingTeam.teamName ) comme attaquante.\n" )
        
        return (local_attackingTeam, local_targetTeam)
    } // end of : func firstRandomRound() -> (Team, Team){

    
    
    // MARK: - Switch Losing Team to Attacking Team
    
    ///Switch Losing Team to Attacking Team
    func switchLosingTeamToAttackingTeam(losingTeam: Team) -> (Team, Team) {
        /// the losing team in the last round becomes the attacking team of the new assault
        let local_AttackingTeam = losingTeam
        let local_TargetTeam = self

        print("  👮🏽‍♂️ L'équipe numéro \"\(local_AttackingTeam.teamId + 1)\" \"\(local_AttackingTeam.teamName )\" \"perdante\" durant l'assaut numéro \(Game.counter-1), devient l'équipe attaquante!" )
        print("")
        return (local_AttackingTeam, local_TargetTeam)
    } // end of :     func switchLosingTeamToAttackingTeam {

    
} //end of: class team
