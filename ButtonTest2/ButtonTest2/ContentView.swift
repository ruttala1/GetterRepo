//
//  ContentView.swift
//  ButtonTest2
//
//  Created by Dhruv Ruttala on 2/8/23.
//

import SwiftUI

struct ContentView: View {
//View is called a protocol - it's a set of rules
    var body: some View {
        
        VStack{
            Button("Click Here", action: {print("Let's Get Started.")})
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print("Welcome!")
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button {
                print("This is a test.")
            } label: {
                HStack{
                    Image(Image(systemName: "pencil"))
                    Text("Edit")
                }
            }

        }
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
