//
//  TVShow.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/16/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit

class TVShow: NSObject {
	
	var thumbnailURL: URL?
	var title: String?
	var genre: [Int]?
	var backImageURL: URL?
	var overview: String?
	var releaseYear: String?
	
	struct TVShowKeys {
		static let name = "name"
		static let genreIDs = "genre_ids"
		static let posterImage = "poster_path"
		static let backImage = "backdrop_path"
		static let overview = "overview"
		static let releaseDate = "first_air_date"
	}
	
	init(with: [String: Any]) {
		title = with[TVShowKeys.name] as? String
		genre = with[TVShowKeys.genreIDs] as? [Int]
		overview = with[TVShowKeys.overview] as? String
		
		let releaseString = with[TVShowKeys.releaseDate] as? String ?? ""
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let date = dateFormatter.date(from: releaseString)
		dateFormatter.dateFormat = "yyyy"
		releaseYear = dateFormatter.string(from: date!)
		
		let thumbURL = with[TVShowKeys.posterImage] as? String ?? ""
		thumbnailURL = URL(string: "\(TVShowEndpoints.imageBasePath)w500\(thumbURL)")
		
		let backURL = with[TVShowKeys.backImage] as? String ?? ""
		backImageURL = URL(string: "\(TVShowEndpoints.imageBasePath)w500\(backURL)")
		
	}
	
}
