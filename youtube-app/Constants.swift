//
//  Constants.swift
//  youtube-app
//
//  Created by Ismatulla Mansurov on 1/7/22.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLEghovcPVHbuUrBikUJEICGStJHtU6eHn"
static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
