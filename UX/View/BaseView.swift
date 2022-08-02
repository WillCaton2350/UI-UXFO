//
//  BaseView.swift
//  UX
//
//  Created by Mini on 7/27/22.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu: Bool = false
    
    // Hiding native one...
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Home"
    
    // Offset for Both Drag Guesture and Showing Menu
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    //Gesuture offset...
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
       // Whole Nav View
        NavigationView {
            HStack(spacing: 0){
                
                // Side Menu..
                SideMenu(showMenu: $showMenu)
                
                // Main Tab View...
                VStack(spacing:0 ){
                    
                    TabView(selection: $currentTab){
                        
                        Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Search")
                        
                        Text("Reports")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Reports")
                        
                        Text("Calendar")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Calendar")
                    }
                    
                    //CustomTabBar...
                    VStack(spacing: 0){
                        
                        Divider()
                        
                        HStack(spacing:0){
                            //Tab buttons....
                            TabButton(image: "Home")
                            
                            TabButton(image: "Search")
                            
                            TabButton(image: "Reports")
                            
                            TabButton(image: "Calendar")
                            
                        }
                        
                        .padding([.top],15)
                    }
                }
                .frame(width:getRect().width)
                
                //BG when menu is showing....
                .overlay(
                    
                    Rectangle()
                        .fill(
                            
                            Color.primary
                                .opacity(Double((offset /
                                    sideBarWidth) / 5))
                        
                        )
                        .ignoresSafeArea(.container,
                            edges: .vertical)
                        .onTapGesture {
                            withAnimation{
                                showMenu.toggle()
                            }
                        }
                )
            }
            //max Size
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            
            // Gesture...
            
            .gesture(
                
                DragGesture()
                    .updating($gestureOffset, body: { value, out,
                        _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
                        
                 
            )
            
            // No Nav bar title...
            // hiding nav bar...
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
        
            
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
            
        }
        
        .onChange(of: gestureOffset) {newValue in
            onChange()
        }
    }
    
    func onChange(){
        let sideBarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset :
                                            offset) : offset
    }
    
    func onEnd(value: DragGesture.Value){
        
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            // checking..
            if translation > 0{
                
                if translation > (sideBarWidth / 2){
                    //showing menu...
                    offset = sideBarWidth
                    showMenu = true
                }
                else{
                    
                    //Extra Cases...
                    if offset == sideBarWidth{
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
                
            }
            else{
                
                if -translation > (sideBarWidth  / 2){
                    offset = 0
                    showMenu = false
                }
                else{
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                }
                
            }
        }
        
        //storing last offset
        lastStoredOffset = offset
        
    }
    
    @ViewBuilder
    func TabButton(image: String)->some View{
        
        Button {
            withAnimation{currentTab = image}
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width:22, height: 22)
                .foregroundColor(currentTab == image ? .primary: .gray)
                .frame(maxWidth: .infinity)
        }
        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
