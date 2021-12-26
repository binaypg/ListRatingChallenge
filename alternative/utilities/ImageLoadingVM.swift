//
//  ImageLoadingVM.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingUIViewModel: ObservableObject {
    @Published var image:UIImage? = nil
    @Published var isLoading:Bool = false
    @Published var name:String? = nil
    
    private let dataService : ImageLoadingService
    private var cancellables = Set<AnyCancellable>()
    
    init(imgUrl:String){
        
        
        self.dataService = ImageLoadingService(urlStrin: imgUrl)
        self.addSubscribers()
        self.isLoading = true
        
        
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self](_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnImg) in
                self?.image = returnImg
            }
            .store(in: &cancellables)

    }
}
 
