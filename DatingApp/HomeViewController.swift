//
//  ViewController.swift
//  DatingApp
//
//  Created by Hassan on 21/11/2019.
//  Copyright © 2019 Hassan. All rights reserved.
//


import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    var images: [InputSource] = [
        ImageSource(image: UIImage(named: "Bitmap")!),
        ImageSource(image: UIImage(named: "Bitmap")!),
        ImageSource(image: UIImage(named: "Bitmap")!),
        ImageSource(image: UIImage(named: "Bitmap")!),
        ImageSource(image: UIImage(named: "Bitmap")!)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setUpTableView()
        setUpImagesSlider()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func nextImageButtonPressed(_ sender: Any) {
        slideshow.nextPage(animated: true)
    }
}
extension HomeViewController {
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .medium, color: nil)
    }
    fileprivate func setupView() {
        percentLabel.layer.cornerRadius = 5
        percentLabel.layer.borderWidth = 1
        percentLabel.layer.borderColor = UIColor.clear.cgColor
        percentLabel.clipsToBounds = true
    }
    
    fileprivate func setUpTableView() {
        infoTableView.dataSource = self
        infoTableView.register(UINib(nibName: "AboutHerTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutHerTableViewCell")
        infoTableView.register(UINib(nibName: "InterestsTableViewCell", bundle: nil), forCellReuseIdentifier: "InterestsTableViewCell")
    }
    
    fileprivate func setUpImagesSlider() {
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .top)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl
        
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
        slideshow.setImageInputs(images)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
}
extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AboutHerTableViewCell", for: indexPath) as? AboutHerTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InterestsTableViewCell", for: indexPath) as? InterestsTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
}
