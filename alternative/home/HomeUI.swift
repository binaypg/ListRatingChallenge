//
//  HomeUI.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI

struct HomeUI: View {
    @StateObject var vm:HomeVM = HomeVM()
    
    var body: some View {
        ScrollView{
            ForEach($vm.userList,id:\.self ){ item in
                
                NavigationLink(){
                    UserInfo(  userInfo: item)
                } label: {
                    HomeCellUI(userInfo: item)
                }
            }
        }
        //.navigationBarTitle("User")
        .navigationBarHidden(true)
    }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeUI()
        }
    }
}
