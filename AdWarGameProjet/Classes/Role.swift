//
//  Role.swift
//  AdWarGameProjet
//
//  Created by Adeline GIROIX on 03/08/2020.
//  Copyright © 2020 Adeline GIROIX. All rights reserved.
//

import Foundation

class Role {

    let roleName: String
    var life: Int
    let maxLife: Int
    
    var roleWeapon: Weapon

    init(roleName: String, life: Int, maxLife: Int, roleWeapon: Weapon) {
        self.roleName = roleName
        self.life = life
        self.maxLife = maxLife
        self.roleWeapon = roleWeapon
        
    } // end of : init(roleName: String, life: Int, maxLife: Int, roleWeapon: Weapon)
} // end of : class Role


class Role_1: Role {
    init() {
        super.init(roleName: constants.ROLE_1, life: constants.ROLE_1_LIFE, maxLife: constants.ROLE_1_MAXLIFE, roleWeapon: Weapon1())
    }
} // end of : class Role_1: Role {


class Role_2: Role {
    init() {
        super.init(roleName: constants.ROLE_2, life: constants.ROLE_2_LIFE, maxLife: constants.ROLE_2_MAXLIFE, roleWeapon: Weapon2())
    }
} //end of : class Role_2: Role {

class Role_3: Role {
    init() {
        super.init(roleName: constants.ROLE_3, life: constants.ROLE_3_LIFE, maxLife: constants.ROLE_3_MAXLIFE, roleWeapon: Weapon3())
    }
} //end of : class Role_3: Role {


class Role_4: Role {
    init() {
        super.init(roleName: constants.ROLE_4, life: constants.ROLE_4_LIFE, maxLife: constants.ROLE_4_MAXLIFE, roleWeapon: Weapon4())
    }
} //end of : class Role_4: Role {


class Role_5: Role {
    init() {
        super.init(roleName: constants.ROLE_5, life: constants.ROLE_5_LIFE, maxLife: constants.ROLE_5_MAXLIFE, roleWeapon: Weapon5())
    }
} //end of : class Role_5: Role {


class Role_6: Role {
    init() {
        super.init(roleName: constants.ROLE_6, life: constants.ROLE_6_LIFE, maxLife: constants.ROLE_6_MAXLIFE, roleWeapon: Weapon6())
    }
} //end of : class Role_6: Role {


class Healer: Role {
    init() {
        super.init(roleName: constants.HEALER_ROLE, life: constants.HEALER_LIFE, maxLife: constants.HEALER_MAXLIFE, roleWeapon: HealerWeapon())
    }
} // end of : class Healer: Role {



