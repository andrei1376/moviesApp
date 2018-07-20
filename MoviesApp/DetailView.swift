//
//  DetailView.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/17/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit
import UIImageColors

class DetailView: UIView {
	
	let thumbnailImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 5
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	let backImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.alpha = 0.3
		return imageView
	}()
	
	let showNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.textColor = .white
		label.numberOfLines = 0
		label.adjustsFontSizeToFitWidth = true
		return label
	}()
	
	let yearLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.textColor = .white
		label.sizeToFit()
		return label
	}()
	
	let subscribeButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("SUBSCRIBIRME", for: .normal)
		button.layer.borderWidth = 2
		button.layer.cornerRadius = 12
		button.layer.borderColor = UIColor.white.cgColor
		button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		button.titleLabel?.minimumScaleFactor = 0.5
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		return button
	}()
	
	let overviewLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "OVERVIEW"
		label.textAlignment = .center
		label.textColor = .white
		label.adjustsFontSizeToFitWidth = true
		return label
	}()
	
	let overviewDataLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.textColor = .white
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews(){
		
		addSubview(backImageView)
		addSubview(thumbnailImageView)
		addSubview(showNameLabel)
		addSubview(yearLabel)
		addSubview(subscribeButton)
		addSubview(overviewLabel)
		addSubview(overviewDataLabel)
		
		addConstraintsWithFormat(format: "H:|[v0]|", views: backImageView)
		addConstraintsWithFormat(format: "V:|[v0]|", views: backImageView)
		
		//thumbanil constraints
		addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 100))
		addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 320))
		addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 180))
		
		
		//titulo del show constraints
		addConstraint(NSLayoutConstraint(item: showNameLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 10))
		addConstraint(NSLayoutConstraint(item: showNameLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		addConstraint(NSLayoutConstraint(item: showNameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
		
		//yearLabel constraints
		addConstraint(NSLayoutConstraint(item: yearLabel, attribute: .top, relatedBy: .equal, toItem: showNameLabel, attribute: .bottom, multiplier: 1, constant: 10))
		addConstraint(NSLayoutConstraint(item: yearLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		addConstraint(NSLayoutConstraint(item: yearLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
		
		//Subscribe constraints
		addConstraint(NSLayoutConstraint(item: subscribeButton, attribute: .top, relatedBy: .equal, toItem: yearLabel, attribute: .bottom, multiplier: 1, constant: 10))
		addConstraint(NSLayoutConstraint(item: subscribeButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		addConstraint(NSLayoutConstraint(item: subscribeButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
		
		//overviewlabel constraints
		addConstraint(NSLayoutConstraint(item: overviewLabel, attribute: .top, relatedBy: .equal, toItem: subscribeButton, attribute: .bottom, multiplier: 1, constant: 10))
		addConstraint(NSLayoutConstraint(item: overviewLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 30))
		addConstraint(NSLayoutConstraint(item: overviewLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
		
		//datalabel constraints
		addConstraint(NSLayoutConstraint(item: overviewDataLabel, attribute: .top, relatedBy: .equal, toItem: overviewLabel, attribute: .bottom, multiplier: 1, constant: 10))
		addConstraint(NSLayoutConstraint(item: overviewDataLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 30))
		addConstraint(NSLayoutConstraint(item: overviewDataLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -30))
	}
	
	
	override func layoutSubviews() {
		
//		let colors = backImageView.image?.getColors()
//		let viewBack = UIView()
//		viewBack.frame = self.backImageView.bounds
//		viewBack.backgroundColor = colors?.primary
//		self.backImageView.addSubview(viewBack)
		
	}
	
	
}
