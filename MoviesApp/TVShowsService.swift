//
//  ServiceAPI.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/16/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

//208ca80dle219453796a7f9792dl6776

import Foundation
import Alamofire


class TVShowsService: NSObject{
	static let sharedInstance = TVShowsService()
	let serviceAPIKey = "208ca80d1e219453796a7f9792d16776"
	
	override init() {
		
	}
	
	func getPopular(completion: @escaping(([TVShow]?)->Void), failure: @escaping((NSError)->Void)){
		if let endpoint = url(for: TVShowEndpoints.popular, key: serviceAPIKey){
			Alamofire.request(endpoint).responseJSON { (response) in
				let jsonDictionary = response.result.value as? [String : Any]
				
				if let tvShowsDict = jsonDictionary!["results"] as? [[String: Any]]{
					var tvShows: [TVShow] = []
					tvShowsDict.forEach{ json in
						let show = TVShow(with: json)
						tvShows.append(show)
					}
					completion(tvShows)
				}else{
					failure(NSError(domain: "TVShowsService", code: -2, userInfo: ["message":"cannot decode response"]))
				}
 
			}
		}
	}
	
	func getGenreList(completion: @escaping([Int:String])-> Void, failure: @escaping((NSError)->Void)){
		if let endpoint = url(for: TVShowEndpoints.genreList, key: serviceAPIKey){
			Alamofire.request(endpoint).responseJSON { (response) in
				let jsonDictionary = response.result.value as? [String : Any]
				
				if let genresDict = jsonDictionary!["genres"] as? [[String: Any]]{
					var genres = [Int : String]()
					genresDict.forEach{ json in
						if let name = json["name"] as? String{
							let id = json["id"] as! Int
							genres[id] = name
						}
					}
					completion(genres)
				}else{
					failure(NSError(domain: "TVShowService-genrelist", code: -2, userInfo: ["message":"error"]))
				}
				
			}
		}
	}
	
	func search(query: String, success: @escaping((SearchResponse)->Void), failure: @escaping((NSError)->Void)) {
		if let endpoint = url(for: TVShowEndpoints.search, key: serviceAPIKey, items: ["query": query]){
			Alamofire.request(endpoint).responseJSON(completionHandler: { (response) in
				let jsonDict = response.result.value as? [String: Any]
				if let searchResponse = SearchResponse.fromJSON(json: jsonDict!){
					success(searchResponse)
				}
			})
		}else {
			failure(NSError(domain: "TVShowService-Search", code: -2, userInfo: ["message":"error"]))
		}
		
	}
	
	
	
	private func url(for path: String, key: String, items:[String: String] = [:]) -> URL?{
		var query = "?api_key=" +  key
		items.forEach{query = query + "&" + $0 + "=" + $1}
		let url = path + query
		return URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
	}

}
