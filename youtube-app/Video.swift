//
//  Video.swift
//  youtube-app
//
//  Created by Ismatulla Mansurov on 1/7/22.
//

import Foundation

struct Video: Decodable {
    
    var videoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {

        case snippet
        case thumbnails
        case high
        case resourceId
        
        case publishedAt = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decorder: Decoder) throws {

        let container = try decorder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        //Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //Parse VideoID
        
        let resourceidContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoID = try resourceidContainer.decode(String.self, forKey: .videoId)
    }
}
