//
//  Model.swift
//  youtube-app
//
//  Created by Ismatulla Mansurov on 1/7/22.
//

import Foundation

class Model {
    
    func getVideos() {
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        // Get a URLs session object
        let session = URLSession.shared
        // Get a Data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                
            }
        }
        // Kick of the task
        
        dataTask.resume()
    }
}
