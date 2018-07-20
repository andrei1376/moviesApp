//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/17/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	var tvShow: TVShow?
	
	lazy var scrollView: UIScrollView = {
		let view = UIScrollView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let detailView: DetailView = {
		let view = DetailView()
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(scrollView)
		scrollView.addSubview(detailView)
		scrollView.delegate = self
		
		setupScrollViewConstraints()
		setupDetailView()
		
		navigationController?.hidesBarsOnSwipe = false
		
	}
	
	func setupScrollViewConstraints(){
		scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
	}
	
	func setupDetailView(){
		detailView.frame = self.view.bounds
		
		detailView.backImageView.loadImageUsingUrl(url: (tvShow?.backImageURL)!)
		detailView.thumbnailImageView.loadImageUsingUrl(url: (tvShow?.thumbnailURL)!)
		detailView.showNameLabel.text = tvShow?.title
		detailView.yearLabel.text = tvShow?.releaseYear
		detailView.overviewDataLabel.text = tvShow?.overview
		detailView.subscribeButton.addTarget(self, action: #selector(handleSubscribe(sender:)), for: .touchUpInside)
		
	}
	
	@objc func handleSubscribe(sender: UIButton){
		sender.setTitle("SUSCRIPTO", for: .normal)
	}
	
	override func viewDidLayoutSubviews() {
		var contentRect = CGRect.zero
		for view in scrollView.subviews[0].subviews {
			contentRect = contentRect.union(view.frame)
		}
		scrollView.contentSize = contentRect.size
		
	}
	
}

extension DetailViewController : UIScrollViewDelegate{
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let y = scrollView.contentOffset.y + 64
		var newHeight = 320 - y
		if newHeight < 160  {
			newHeight = 160 //el height minimo
		}else if newHeight > 320 {
			newHeight = 320 //el height maximo
		}
		detailView.thumbnailImageView.bounds.size = CGSize(width: newHeight * 9 / 16, height: newHeight) //calculo para mantener el aspect ratio
		
	}
	
	
}
