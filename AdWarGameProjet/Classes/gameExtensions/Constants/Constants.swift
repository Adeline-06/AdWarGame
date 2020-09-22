//
//  Constants.swift
//  AdWarGameProjet
//
//  Created by Adeline GIROIX on 03/08/2020.
//  Copyright © 2020 Adeline GIROIX. All rights reserved.
//

import Foundation

import Foundation

struct constants {
    
    // Static let game
    static let GAME_TITLE = "AD WAR GAME"
    
    static let LINE = "====================================================\n"
    
    static let TIRETS = "----------------------------------------------------\n"
    
    static let SUB_TIRETS = "      ----------------------------------------------\n"
    
    static let SUB_LINE = "   =================================================\n"
    
    static let SUB_SUB_LINE = "      =================================================\n"
    
    static let USED_NAME = "⛔️ Erreur! Ce nom est déjà utilisé, veuillez en choisir un autre ! ⚠️"
    
    static let VALID_NAME = " ⛔️ Erreur! ! Entrez au moins 2 caracteres alpha-numeriques valides ! ⚠️"

//
    //Default Players number
    static let DEFAULT_PLAYERS_NUMBER = 2 // limited to 6
    
    //Default Characters number
    static let DEFAULT_CHARACTERS_NUMBER = 3
    
    //Default roles number
    static let DEFAULT_ROLE_NUMBER = 6
    
    //
    static let STATUS_INDICATOR_WINNER = "🏆"
    static let STATUS_INDICATOR_LOOSER = "⚫️"
    static let STATUS_INDICATOR_DEAD = "💀"
    
    
    // Character_1 constants
    static let ROLE_1 = "🧟‍♂️ Zombie  "
    static let ROLE_1_LIFE = 100
    static let ROLE_1_MAXLIFE = 100
    
    static let WEAPON_1 = "🪓 Hache contaminée de sang zombie"
    static let WEAPON_1_EFFECT = -50

    // Character_2 constants
    static let ROLE_2 = "🧝🏼‍♀️ Elfe  "
    static let ROLE_2_LIFE = 100
    static let ROLE_2_MAXLIFE = 100
    
    static let WEAPON_2 = "🏹 Fléche"
    static let WEAPON_2_EFFECT = -60
    

    //Character_3 constants
    static let ROLE_3 = "🧜🏼‍♀️ Siréne  "
    static let ROLE_3_LIFE = 100
    static let ROLE_3_MAXLIFE = 100
    
    static let WEAPON_3 = "🎶 Voix ensorcelante"
    static let WEAPON_3_EFFECT = -40
    
    //Character_4 constants
    static let ROLE_4 = "🧙🏽‍♀️ Sorcière  "
    static let ROLE_4_LIFE = 100
    static let ROLE_4_MAXLIFE = 100
    
    static let WEAPON_4 = "🧹 Balai magique de feu "
    static let WEAPON_4_EFFECT = -60

    // Character_5 constants
    static let ROLE_5 = "🦸🏽‍♂️ Super héro  "
    static let ROLE_5_LIFE = 100
    static let ROLE_5_MAXLIFE = 100
    
    static let WEAPON_5 = "☄️ Boule de feu "
    static let WEAPON_5_EFFECT = -50

    //Character_6 constants
    static let ROLE_6 = "🧛🏽‍♂️ Vampire  "
    static let ROLE_6_LIFE = 100
    static let ROLE_6_MAXLIFE = 100
    
    static let WEAPON_6 = "🦇 Chauve souris venimeuse"
    static let WEAPON_6_EFFECT = -40

    //Character_Healer constants
    static let HEALER_ROLE = "🚑 Guérisseur"
    static let HEALER_LIFE = 100
    static let HEALER_MAXLIFE = 100
    
    static let HEALER_WEAPON = "Surgery "
    static let HEALER_EFFECT = 100
      
    //Magic Weapon
    static let MAGIC_WEAPON = "Fire of devil 👺"
    static let MAGIC_EFFECT = -1000

}
