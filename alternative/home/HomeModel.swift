//
//  HomeModel.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import Foundation

// MARK: - WelcomeElement
struct UserListArray: Codable ,Hashable{
    var url: String?
    var image: [String]?
    var type: UserType?
    var uuid:String?
    var name: String?
    var feedback:Int?
    
    static let example = UserListArray(url: "David_Cameron",
                                       image:  [
                                        "https://d93golxnkabrk.cloudfront.net/things/bb7f48fa-a904-11e1-9412-005056900141.jpg?w=200"
                                       ],
                                       type: UserType.publicFigure,
                                       uuid: "bb7f48fa-a904-11e1-9412-005056900141",
                                       name: "David Cameron",
                                       feedback: 1)
}

enum UserType: String, Codable {
    case activity = "Activity"
    case actor = "Actor"
    case animal = "Animal"
    case artist = "Artist"
    case brand = "Brand"
    case comedian = "Comedian"
    case confectionery = "Confectionery"
    case fruit = "Fruit"
    case institution = "Institution"
    case movie = "Movie"
    case musicArtist = "Music Artist"
    case newspaper = "Newspaper"
    case politicalParty = "Political Party"
    case publicFigure = "Public Figure"
    case sportsPersonality = "Sports Personality"
    case sportsTeam = "Sports Team"
    case tvChannel = "TV Channel"
    case tvPersonality = "TV Personality"
    case tvProgramme = "TV Programme"
    case ukPlace = "UK Place"
    case writer = "Writer"
}

// typealias Welcome = [WelcomeElement]
