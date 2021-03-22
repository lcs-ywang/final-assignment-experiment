//
//  Dinein_or_Takeout.swift
//  final assignment experiment
//
//  Created by Yining Wang on 2021-03-22.
//

import SwiftUI

import SwiftUI

struct Dinein_or_Takeout: View {

    // MARK: Stored properties
    
    // This is a derived value
    // The source of truth is the property created at the app entry point
    // Line 14 of CourseSelectionAssistantApp.swift
    @ObservedObject var dataStore: Store
    
    var body: some View {
        
        // Start a list
        List {
            
            // Iterate over the subjects
            ForEach(Array(dataStore.Houses.keys.sorted()), id: \.self) { house in
                
                // Pass the courses for this subject area to the next view
                NavigationLink(destination: MealScheduleDetailed(courses: dataStore.subjects[subject]!)) {
                    Text(subject)
                }
                
            }
            
        }
        .navigationTitle("Subjects")
        
    }
}

struct SubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView(dataStore: testStore)
    }
}
