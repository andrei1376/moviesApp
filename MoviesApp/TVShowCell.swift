//
//  TVShowCell.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/16/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit

class TVShowCell: UICollectionViewCell{
	
	private lazy var gradient: UIView = {
		let view = UIView(frame: self.bounds)
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = bounds
		gradientLayer.colors = [Colors.gradientColorPrimary.cgColor, Colors.gradientColorSecondary.cgColor]
		gradientLayer.locations = [1.0, 1.0]
		gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
		gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
		view.layer.insertSublayer(gradientLayer, at: 0)
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	let thumbnailImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 5
		return imageView
	}()
	
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.textColor = .white
		label.clipsToBounds = true
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 10
		return label
	}()
	
	let genreLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .right
		label.textColor = .white
		label.backgroundColor = Colors.labelColor
		label.layer.cornerRadius = 5
		label.clipsToBounds = true
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 10
		return label
	}()
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews(){
		addSubview(thumbnailImageView)
		addSubview(titleLabel)
		addSubview(genreLabel)
		
		addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
		addConstraintsWithFormat(format: "V:|-16-[v0]-16-|", views: thumbnailImageView)
		
		//Constraints for GENERO
		addConstraint(NSLayoutConstraint(item: genreLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .top, multiplier: 1, constant: 8))
		addConstraint(NSLayoutConstraint(item: genreLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: -8))
		addConstraint(NSLayoutConstraint(item: genreLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
		
		//Constraints for Titulo
		addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: -8))
		addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .left, multiplier: 1, constant: 8))
		addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 50))
		
		
	}
	
	override func layoutSubviews() {
		gradient.removeFromSuperview()
		thumbnailImageView.addSubview(gradient)
	}
	
}

