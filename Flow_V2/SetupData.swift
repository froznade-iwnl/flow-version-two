//
//  SetupData.swift
//  Flow_V2
//
//  Created by CTSS Students on 25/10/22.
//

import Foundation
import SwiftUI

extension Color {
    
    static let bgColor = Color("MainColor")
    static let textColor = Color("AccentColor")
    
}

struct newsSite: Identifiable {
    var id = UUID()
    var name: String
    var destination: AnyView
    var description: String
    var imagelink: String
}

var newsSites = [
    newsSite(name: "The Guardian", destination: AnyView(TheGuardianView()), description: "The Guardian is a British daily newspaper. It was founded in 1821 as The Manchester Guardian; it changed its name in 1959.", imagelink: "https://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2010/03/01/poweredbyguardianBLACK.png"),
    newsSite(name: "Telegraph", destination: AnyView(TelegraphView()), description: "The Telegraph is an award-winning, multimedia news brand that has been synonymous with quality, authority and credibility for more than 165 years.", imagelink: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/The_Telegraph_logo.svg/1200px-The_Telegraph_logo.svg.png"),
    newsSite(name: "The Times", destination: AnyView(TheTimesView()), description: "The Times was founded in 1785 by the editor and publisher John Walter I, “to record the principal occurrences of the times” for the service of the public.", imagelink: "https://www.thetimes.co.uk/d/img/logos/times-black-ee1e0ce4ed.png"),
    newsSite(name: "DNA", destination: AnyView(DNAView()), description: "Launched on July 30, 2005, in Mumbai, dna is an English broadsheet daily owned by Diligent Media Corporation, an Essel Group company.", imagelink: "https://english.cdn.zeenews.com/static/apprun/dna/icons/logodna.png"),
]

