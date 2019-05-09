//
//  SportTime.swift
//  SportTime
//
//  Created by Игорь Сазонов on 23/01/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation
import CoreData

class SportTime {
    let naem:String
    let pabota:String
    let podxodu:String
    let otdux:String
    let pabotaMinutes:Int
    let pabotaSeconds:Int
    let otduxMinutes:Int
    let otduxSeconds:Int
    let podxoduTime:Int
    
    
    init (naem:String, pabota:String, podxodu:String, otdux:String, pabotaMinutes:Int, pabotaSeconds:Int, otduxMinutes:Int, otduxSeconds:Int, podxoduTime:Int) {
        self.naem = naem
        self.pabota = pabota
        self.podxodu = podxodu
        self.otdux = otdux
        self.pabotaMinutes = pabotaMinutes
        self.pabotaSeconds = pabotaSeconds
        self.otduxMinutes = otduxMinutes
        self.otduxSeconds = otduxSeconds
        self.podxoduTime = podxoduTime
    }
}

