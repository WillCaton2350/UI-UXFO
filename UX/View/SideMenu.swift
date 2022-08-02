//
//  SideMenu.swift
//  UX
//
//  Created by Mini on 7/27/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 14) {
                Image("Heart")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:65, height: 65)
                    .clipShape(Circle())
                
                Text("Family Organizer")
                    .font(.title2.bold())
                
                Text("William Caton")
                    .font(.callout)
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack{
                    
                    VStack(alignment: .leading, spacing:45) {
                        //Tab buttons...
                        TabButton(title: "Personal Information", image: "Profile")
                        
                        TabButton(title: "Household Expenses", image: "Home")
                        
                        TabButton(title: "Health, Dental & Vision", image: "Health")
                        
                        TabButton(title: "Vehicle Documentation", image: "Car")
                        
                        TabButton(title: "Insurance Policies", image: "Clipboard")
                        
                        TabButton(title: "Tax Documents", image: "Taxes")
                        
                        TabButton(title: "Debt & Liabilites", image: "Debt")
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 45)
                    
                    Divider()
                    
                    TabButton(title: "Upgrade", image: "Star-Mode")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 30){
                        Button("Settings and Privacy"){
                             
                        }
                        Button("Help Center"){
                             
                        }
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.primary)
                }
            }
            
            VStack(spacing:0){
                
                Divider()
                
                HStack{
                    
                    Button{
                        
                    }label: {
                        
                        Image("Light")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height:22)
                        
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        
                        Image("QR")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height:22)
                        
                    }
                }
                
                .padding([.horizontal, .top],15)
                .foregroundColor(.primary)
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        // max width...
        .frame(width: getRect().width - 90)
        .padding(.leading)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String,image: String)-> some View{
        
        // For Navigation
        // Simple replace button with navigation links...
        
        NavigationLink{
            
            Text("\(title)")
                .navigationTitle(title)
        
            
        } label: {
            
            HStack(spacing: 14){
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height:22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending view to get screen rectangle

extension View {
   func getRect()->CGRect {
        return UIScreen.main.bounds
            
        }
    }
 


