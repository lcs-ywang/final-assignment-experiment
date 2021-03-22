
import Foundation

// This structure is configured to enable reading of data from this spreadsheet:
//
// https://docs.google.com/spreadsheets/d/1zrtYh9k2egZxOfsjqkDlLvbEQBBXV7S1a_5zXEagqAQ/edit?usp=sharing
//
// ... via this Sheety endpoint:
//
// https://api.sheety.co/73a333855fd3edc50f8b28aba37efaa1/dineInOrTakeOut/dineInOrTakeOut
//
struct Times: Codable {
    
    // MARK: Properties
    
    // Will eventually be populated with a list of courses defined in the spreadsheet
    // Begins as an empty list
    var list: [Time] = []
    
}
