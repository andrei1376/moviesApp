//
//  MainViewController.swift
//  MoviesApp
//
//  Created by Emiliano Baublys on 7/16/18.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	
	var tvShows: [TVShow]?
	var genreMap = [Int : String]()
	
	let cellID = "cellID"
	let headerID = "headerID"
	
	override func viewDidLoad() {
		super.viewDidLoad()

		fetchTVShows()
		fetchGenres()
		
		collectionView?.backgroundColor = Colors.primaryColor
		collectionView?.register(TVShowCell.self, forCellWithReuseIdentifier: cellID)
		collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
		
		setupNavBarButtons()
	}
	
	func setupNavBarButtons(){
		navigationItem.title = "TV Shows"
		
		let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
		let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
		navigationItem.leftBarButtonItem = searchBarButtonItem
		navigationController?.hidesBarsOnSwipe = true
	}
	
	@objc func handleSearch(){
		print("Searching..")
	}
	
	func fetchTVShows() {
		//api request
		TVShowsService.sharedInstance.getPopular(completion: { (tvshow) in
			self.tvShows = tvshow
			self.collectionView?.reloadData()
		}, failure: { error in
			print(error)
		})
		collectionView?.reloadData()
	}
	
	func fetchGenres(){
		TVShowsService.sharedInstance.getGenreList(completion: { genres in
			self.genreMap = genres
			self.collectionView?.reloadData()
		}, failure: { error in
			print(error)
		})
	}
	
	private func genreIdsToText(_ genres:[Int]) -> String{
		if genreMap.count == 0{
			return ""
		}
		
		var genreText = [String]()
		for id in genres{
			if let genre = genreMap[id]{
				genreText = [genre]
			}
		}
		
		return genreText[0].uppercased()
		
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return tvShows?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let height = (view.frame.width - 16 - 16) * 9 / 16 // *9/16 es para mantener el ratio
		
		return CGSize(width: view.frame.width - 16, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
		
		let label = UILabel()
		label.text = "RECOMENDADAS"
		label.frame = header.frame
		label.textColor = .white
		header.addSubview(label)
		return header
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 25)
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TVShowCell
		
		cell.titleLabel.text = tvShows?[indexPath.item].title
		cell.genreLabel.text = genreIdsToText((tvShows?[indexPath.item].genre)!)
		cell.thumbnailImageView.loadImageUsingUrl(url: (tvShows?[indexPath.item].thumbnailURL)!)
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		performPush(show: (tvShows?[indexPath.item])!)
		
	}
	
	
	
	func performPush(show: TVShow){
		let vc = DetailViewController()
		vc.tvShow = show
		
		let transition = CATransition()
		transition.duration = 0.5
		transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		transition.type = kCATransitionFade
		
		navigationController?.view.layer.add(transition, forKey: nil)
		navigationController?.pushViewController(vc, animated: false)
	}
	
	
}
