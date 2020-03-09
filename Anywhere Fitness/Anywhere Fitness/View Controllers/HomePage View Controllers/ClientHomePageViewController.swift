//
//  ClientHomePageViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 27/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class ClientHomePageViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var nearbyPopularCollectionView: UICollectionView!
    @IBOutlet weak var preferenceCollectionView: UICollectionView!
    @IBOutlet weak var newClassesCollectionView: UICollectionView!
    @IBOutlet weak var statusBarView: UIView!
    
    let firebaseController = FirebaseController()
    var nearbyPopularClasses: [ExerciseClass] = []
    
    //MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firebaseController.delegate = self
        firebaseController.fetchAllClasses()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        //Configure NavigationBar Style
        if let navBar = navigationController?.navigationBar {
            ThemeController.shared.adjustHomePageNavigationBar(for: navBar)
        }
        
        //Configure UITabBar
        if let tabBar = tabBarController?.tabBar {
            ThemeController.shared.adjustHomePageTabBar(for: tabBar)
        }
        
        //Configure statusBarView
        statusBarView.backgroundColor = ThemeController.shared.redButtonColor
        
        //Configure CollectionViews
        nearbyPopularCollectionView.delegate = self
        nearbyPopularCollectionView.dataSource = self
        nearbyPopularCollectionView.register(UINib.init(nibName: "ClassCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NearbyClassCell")
        preferenceCollectionView.delegate = self
        preferenceCollectionView.dataSource = self
        preferenceCollectionView.register(UINib.init(nibName: "ClassCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PreferenceClassCell")
        newClassesCollectionView.delegate = self
        newClassesCollectionView.dataSource = self
        newClassesCollectionView.register(UINib.init(nibName: "ClassCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewClassCell")
    }
    
    private func retrieveClassesFromServer() {

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ClientHomePageViewController: UICollectionViewDelegate {
    
}

extension ClientHomePageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == nearbyPopularCollectionView {
            return nearbyPopularClasses.count
        } else if collectionView == preferenceCollectionView {
            return 3
        } else if collectionView == newClassesCollectionView {
            return 2
        }
            
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let nearbyCell = nearbyPopularCollectionView.dequeueReusableCell(withReuseIdentifier: "NearbyClassCell", for: indexPath) as? ClassCollectionViewCell else { return UICollectionViewCell() }
        let indexPathRow = indexPath.row
        if indexPathRow <= nearbyPopularClasses.count - 1 {
            nearbyCell.exerciseClass = nearbyPopularClasses[indexPath.row]
        }
        
        if collectionView == preferenceCollectionView {
            guard let preferenceCell = preferenceCollectionView.dequeueReusableCell(withReuseIdentifier: "PreferenceClassCell", for: indexPath) as? ClassCollectionViewCell else { return UICollectionViewCell() }
            preferenceCell.classTypeLabel.text = "Sprinting"
            return preferenceCell
        } else if collectionView == newClassesCollectionView {
            guard let newClassCell = newClassesCollectionView.dequeueReusableCell(withReuseIdentifier: "NewClassCell", for: indexPath) as? ClassCollectionViewCell else { return UICollectionViewCell() }
            newClassCell.classTypeLabel.text = "Pilates"
            return newClassCell
        }

        return nearbyCell
    }
    
}

extension ClientHomePageViewController: ClassesFetched {
    
    func classesWereFetched() {
        nearbyPopularClasses = firebaseController.classes
        nearbyPopularCollectionView.reloadData()
    }
    
}
