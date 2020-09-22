//
//  Weapon.swift
//  AdWarGameProjet
//
//  Created by Adeline GIROIX on 03/08/2020.
//  Copyright © 2020 Adeline GIROIX. All rights reserved.
//

import Foundation

class Weapon {
    
    let weaponName : String
    let effect: Int
    
    init(weaponName: String, effect: Int) {
        self.weaponName = weaponName
        self.effect = effect
    }//End of init(damage: Int, weaponName: String)
    
}//End of class Weapon

class Weapon1: Weapon {
    init() {
        super.init(weaponName: constants.WEAPON_1, effect: constants.WEAPON_1_EFFECT)
    }
} // end of : class Weapon1: Weapon {


class Weapon2: Weapon {
    init() {
        super.init(weaponName: constants.WEAPON_2, effect: constants.WEAPON_2_EFFECT)
    }
} // end of : class Weapon2: Weapon {

class Weapon3: Weapon {
    init() {
        super.init(weaponName: constants.WEAPON_3, effect: constants.WEAPON_3_EFFECT)
    }
} // end of : class Weapon3: Weapon {

class Weapon4: Weapon {
    init() {
        super.init(weaponName: constants.WEAPON_4, effect: constants.WEAPON_4_EFFECT)
    }
} // end of : class Weapon4: Weapon {

class Weapon5: Weapon {
    init() {
        super.init(weaponName: constants.WEAPON_5, effect: constants.WEAPON_5_EFFECT)
    }
} // end of : class Weapon5: Weapon {

class Weapon6: Weapon {
    init() {
        super.init(weaponName: constants.WEAPON_6, effect: constants.WEAPON_6_EFFECT)
    }
} // end of : class Weapon6: Weapon {

class HealerWeapon: Weapon {
    init() {
        super.init(weaponName: constants.HEALER_WEAPON, effect: constants.HEALER_EFFECT)
    }
} // end of : class HealerWeapon: Weapon {

    
    class MagicWeapon: Weapon {
    init() {
        super.init(weaponName: constants.MAGIC_WEAPON, effect: constants.MAGIC_EFFECT)
    }
} // end of : class MagicWeapon: Weapon {
