//
//  Extensions.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/16/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIView {
	
	func addConstraintsWithFormat(format: String, views: UIView...){
		
		var viewsDictionary = [String: UIView]()
		for (index, view) in views.enumerated(){
			let key = "v\(index)"
			view.translatesAutoresizingMaskIntoConstraints = false
			viewsDictionary[key] = view
		}
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	}
	
}

extension UIImageView {
	
	func loadImageUsingUrl(url: URL){
		Alamofire.request(url).responseImage(completionHandler: { (response) in
			if let image = response.result.value {
				DispatchQueue.main.async {
					self.image = image
				}
			}
		})
	}
	
}





