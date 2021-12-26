//
//  HomeVM.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI
import Combine

class HomeVM:  ObservableObject{
    @Published var userList:[UserListArray] = []
    
    init(){
        loadJsonData()
    }
    
    func loadJsonData(){
        guard let url = Bundle.main.url(forResource: "entities", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let userList = try? JSONDecoder().decode([UserListArray].self, from: data!)
        self.userList = userList ?? []
    }
}
