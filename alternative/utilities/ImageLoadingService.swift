//
//  ImageLoadingService.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//
 
import Foundation
import Combine
import SwiftUI

class ImageLoadingService{
    @Published var image:UIImage? = nil
    private var imageSubscription: AnyCancellable?
    init(urlStrin: String){
        loadimage(urlString: urlStrin)
    }
    
    private func loadimage(urlString:String){
         
        guard let url = URL(string: urlString) else { return }
        imageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion:  NetworkingManager.handleCompletion, receiveValue: { [weak self](returnedImg) in
                
                self?.image = returnedImg
                self?.imageSubscription?.cancel()
            })
        
        
        
        
    }
}
