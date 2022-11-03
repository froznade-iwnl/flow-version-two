//
//  CheckInData.swift
//  Flow_V2
//
//  Created by CTSS Students on 2/11/22.
//

import Foundation
import SwiftUI

struct emotion: Identifiable, Codable {
    var id: Int
    var image: String
    var emotionID: Int
}


class EmotionManager: ObservableObject {
@Published var emotions: [emotion] = [] {
didSet {
save()
        }
    }
let sampleemotions: [emotion] = []
init() {
load()
    }
func getArchiveURL() -> URL {
let plistName = "emotions.plist"
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
return documentsDirectory.appendingPathComponent(plistName)
    }
func save() {
let archiveURL = getArchiveURL()
let propertyListEncoder = PropertyListEncoder()
let encodedemotions = try? propertyListEncoder.encode(emotions)
try? encodedemotions?.write(to: archiveURL, options: .noFileProtection)
    }
func load() {
let archiveURL = getArchiveURL()
let propertyListDecoder = PropertyListDecoder()
var finalemotions: [emotion]!
if let retrievedemotionData = try? Data(contentsOf: archiveURL),
let decodedemotions = try? propertyListDecoder.decode([emotion].self, from: retrievedemotionData) {
finalemotions = decodedemotions
        } else {
finalemotions = sampleemotions
        }
emotions = finalemotions
    }
}
