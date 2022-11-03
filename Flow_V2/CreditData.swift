//
//  CreditData.swift
//  Flow_V2
//
//  Created by CTSS Students on 3/11/22.
//

import Foundation

let credit = creds(
    url: "https://www.nhs.uk",
    logo: "https://www.nhs.uk/nhscwebservices/documents/logo1.jpg",
    email:"nhswebsite.servicedesk@nhs.net",
    name:"NHS website"
)


struct creds {
    var url: String
    var logo: String
    var email: String
    var name: String
}
