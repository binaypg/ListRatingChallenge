//
//  NetworkingManager.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import Foundation
import Combine


class NetworkingManager{
    
    // The Request Method
    enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
        case put     = "PUT"
        case delete  = "DELETE"
    }
    static func download(url:URL) -> AnyPublisher<Data,Error>{
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap({   try handleURLResponce(output: $0,url:url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(_):
            //print("error::",error.localizedDescription)
            break
            
        }
    }
    
    static func handleURLResponce(output: URLSession.DataTaskPublisher.Output,url:URL) throws ->Data{
           
           guard let response = output.response as? HTTPURLResponse,
                 response.statusCode >= 200 && response.statusCode < 300 else {
                     
                     throw  NetworkingError.badURLResponse(url: url )
                     
                 }
           
           return output.data
       }
    
    
    enum NetworkingError:LocalizedError{
        case badURLResponse(url: URL )
        case Unknow
        
        var errorDescription: String?{
            switch self{
            case .badURLResponse(url:let url): return "[] Bad Responce from URL. \(url)"
            case .Unknow: return "[] Unknow error occured"
            }
        }
    }
}
