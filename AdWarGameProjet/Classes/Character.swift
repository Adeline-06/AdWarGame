//
//  Character.swift
//  AdWarGameProjet
//
//  Created by Adeline GIROIX on 03/08/2020.
//  Copyright © 2020 Adeline GIROIX. All rights reserved.
//

import Foundation

class Character {
    
    // MARK: - properties and initialisation
    
    let gameName: String
    
    let teamId:Int
    let teamName: String
    
    let characterId: Int
    let characterName: String
    
    var role: Role = Healer() // arbitrary initializations to avoid optional problems 
       
    init(gameName: String, teamId: Int, teamName: String, characterId: Int, characterName: String) {
        
        self.gameName = gameName
        
        self.teamId = teamId
        self.teamName = teamName
        
        self.characterId = characterId
        self.characterName = characterName
    } // end of : init
    
    func createRole() {
        /// variable of input verification
        var isInputOk: Bool
        displayAllRoles()
        repeat {
            print("      \n    🔎  Quel guerrier attribuez-vous à \(self.characterName) : ", terminator: "")
            isInputOk = true
            if let inputKeybord = readLine() {
                switch inputKeybord {
                case "1" :
                    role = Role_1()
                case "2" :
                    role = Role_2()
                case "3" :
                    role = Role_3()
                case "4" :
                    role = Role_4()
                case "5" :
                    role = Role_5()
                case "6" :
                    role = Role_6()
                case "7" :
                    role = Healer()
                default:
                    isInputOk = false
                    print("\n⛔️ Erreur! Vous devez saisir un chiffre entre 1 and 7 ! ⛔️\n")
                } // end of : switch inputKeybord {
            } // end of : if let inputKeybord = readLine() {

        } while isInputOk == false
    } // end of : func createRole() {
    
    fileprivate func displayAllRoles() {
        print("")
        print("      1️⃣ : \(constants.ROLE_1)\n")
        print("      2️⃣ : \(constants.ROLE_2)\n")
        print("      3️⃣ : \(constants.ROLE_3)\n")
        print("      4️⃣ : \(constants.ROLE_4)\n")
        print("      5️⃣ : \(constants.ROLE_5)\n")
        print("      6️⃣ : \(constants.ROLE_6)\n")
        print("      7️⃣ : \(constants.HEALER_ROLE)")
    } // end of : fileprivate func displayAllRoles() {

    
    // MARK: - Display Characteristic's characters
    
    /// print character's characteristics
    func displayTheCharacteristicsOfOneCharacterOfTheTeam() {
        let sign = self.role.roleWeapon.effect > 0 ? "+" : ""
        print("     \"\(self.characterName)\", un \"\(self.role.roleName)\" avec \(self.role.life)\\\(self.role.maxLife) points de vie,\n     Action : \"\(self.role.roleWeapon.weaponName)\" avec un impact de \(sign)\(self.role.roleWeapon.effect) points de vie pour la victime.\n")
    } // end of : func displayTheCharacteristicsOfOneCharacterOfTheTeam() {


} //end of: class character {



