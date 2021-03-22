

import Foundation

// This structure has properties that match the columns of this spreadsheet:
//
// https://docs.google.com/spreadsheets/d/1zrtYh9k2egZxOfsjqkDlLvbEQBBXV7S1a_5zXEagqAQ/edit?usp=sharing
//
// ... whose data is accessed via this endpoint:
//
// https://api.sheety.co/73a333855fd3edc50f8b28aba37efaa1/dineInOrTakeOut/dineInOrTakeOut
//
struct Time: Codable, Identifiable {

    let house: String
    let date: Int
    let brLocation: String
    let brTime: String
    let luLocation: String
    let luTime: String
    let diLocation: String
    let diTime: String
    let id: Int
}
