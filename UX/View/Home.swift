//
//  Home.swift
//  UX
//
//  Created by Mini on 7/29/22.
//

import SwiftUI

struct Home: View {
    @Binding var showMenu: Bool
    var body: some View {
        
        VStack {
            
            VStack(spacing: 0){
                
                HStack{
                    
                    Button{
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("Family")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:35, height:35)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    // Navigation Link...
                    
                    NavigationLink {
                        
                        Text("Settings View")
                            .navigationTitle("Settings")
                        
                    } label: {
                        
                        Image("set")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:22, height:22)
                            .foregroundColor(.primary)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                
                Divider()
            }
            .overlay(
                
                Image("Heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:25, height: 25)
            
            )
            Spacer()
        }
        
 
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
