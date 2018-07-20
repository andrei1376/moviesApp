//
//  Endpoints.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/16/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import Foundation

struct TVShowEndpoints{
	private static let idPlaceholder = ":id"
	private static let basePath = "https://api.themoviedb.org/3/"
	private static let popularPath = "tv/popular"
	private static let genrePath = "genre/tv/list"
	private static let searchMoviePath = "search/tv"
	
	static let imageBasePath = "https://image.tmdb.org/t/p/" // + w300/imageID.jpg
	
	static var popular: String {
		return basePath + popularPath
	}
	
	static var genreList: String {
		return basePath + genrePath
	}
	
	static var search: String {
		return basePath + searchMoviePath
	}
	
}
