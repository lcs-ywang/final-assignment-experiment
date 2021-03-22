//
//  ContentView.swift
//  final assignment experiment
//
//  Created by Yining Wang on 2021-03-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            
            List{
                NavigationLink(destination: Breakfast()){
                    HStack{
                        
                        Text("🥞")
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading){
                            Text("Breakfast")
                                .multilineTextAlignment(.leading)
                            
                            Text("The most significant meal for a day.")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                }
                
                NavigationLink(destination: Lunch()){
                    HStack{
                        
                        Text("🍱")
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading){
                            Text("Lunch")
                                .multilineTextAlignment(.leading)
                            
                            Text("Lunch is important for the classes in the afternoon.")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                }
                
                NavigationLink(destination: Dinner()){
                    HStack{
                        
                        Text("🍛")
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading){
                            Text("Dinner")
                                .multilineTextAlignment(.leading)
                            
                            Text("Dinner is delicious today.")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                }
                
               
                NavigationLink(destination: Dinein_or_Takeout()){
                    HStack{
                        
                        Text("🍽")
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading){
                            Text("Dine-in or Take-out")
                                .multilineTextAlignment(.leading)
                            
                            Text("Figure it out whether Dine-in or Take-out")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                    .padding()
                    
                }
                
            }
            .navigationBarTitle("LCS Meal")
            
        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
