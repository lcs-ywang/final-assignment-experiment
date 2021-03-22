//
//  Store.swift
//  CourseSelectionAssistant (iOS)
//
//  Created by Russell Gordon on 2021-03-17.
//

import Foundation

// The purpose of this class is to kick of the initialization of the list of courses obtained from the JSON endpoint
class Store: ObservableObject {
    
    // MARK: Stored properties
    @Published var DineSchedule = Times()
    @Published var Houses = [String : [Time]]()
    
    // MARK: Initializer
    init(loadFromRemote: Bool = true) {
        
        // By default load from a remote data source
        if loadFromRemote {
            
            // 1. Prepare a URLRequest to obtain the list of courses
            let url = URL(string: "https://api.sheety.co/73a333855fd3edc50f8b28aba37efaa1/dineInOrTakeOut/list")!
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            // 2. Run the request and process the response
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                // Handle the result here – attempt to unwrap optional data provided by task
                guard let dataFromSheety = data else {
                    
                    // Show the error message
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                    
                    return
                }
                
                // DEBUG: Print the data received from the Sheety endpoint
                print(String(data: dataFromSheety, encoding: .utf8)!)
                
                // Now decode from JSON into an array of Swift native data types
                
                do {
                    
                    // Attempt to decode the JSON into an instance of the Courses structure
                    let decodeTimes = try JSONDecoder().decode(Times.self, from: dataFromSheety)
                    
                    // Print a status message to the console
                    print("Course list summary decoded from JSON from Sheety API endpoint successfully")
                    
                    // Update the list of courses on the main thread
                    DispatchQueue.main.async {
                        
                        // Set the list of courses that have been downloaded
                        self.DineSchedule.list = decodeTimes.list
                        
                        // Create a dictionary with courses grouped by curriculum (subject)
                        self.Houses = Dictionary(grouping: self.DineSchedule.list, by: { $0.house })
                        
                    }

                } catch {
                    
                    // Could not decode the JSON
                    print("JSON could not be decoded.")
                    
                    // Print a useful error message
                    print(error)

                }
                                
            }.resume()

        } else {
            
            // Otherwise load from a local JSON file to save network traffic and usage of API
            if let url = Bundle.main.url(forResource: "Mealschedule", withExtension: "json") {
                do {
                    
                    let dataFromAppBundle = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let decodeTimes = try decoder.decode(Times.self, from: dataFromAppBundle)
                    
                    // Print a status message to the console
                    print("Course list summary decoded from JSON from app bundle successfully")
                    
                    // Update the list of courses in this data store
                    self.DineSchedule.list = decodeTimes.list
                    
                    // Create a dictionary with courses grouped by curriculum (subject)
                    self.Houses = Dictionary(grouping: self.DineSchedule.list, by: { $0.house })
                    
                } catch {

                    // Could not decode the JSON
                    print("JSON could not be decoded.")
                    
                    // Print a useful error message
                    print(error)

                }
            }
            
        }
        
    }
    
}

// Create a test store for use with Xcode previews
let testStore = Store(loadFromRemote: false)

