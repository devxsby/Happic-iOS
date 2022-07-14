//
//  TabBarController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/04.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setDelegate()
    }
    
    // MARK: - Functions
    private func setTabBar() {
        view.backgroundColor = .black
        
        let homeController = templateNavigationController(title: "홈",
                                                          unselectedImage: UIImage(systemName: "house")!,
                                                          selectedImage: UIImage(systemName: "house")!,
                                                          rootViewController: HomeController())
        
        let haruHappicController = templateNavigationController(title: "하루해픽",
                                                                unselectedImage: UIImage(systemName: "calendar")!,
                                                                selectedImage: UIImage(systemName: "calendar")!,
                                                                rootViewController: HaruHappicController())
        
        let createContentsController = templateNavigationController(title: "",
                                                                    unselectedImage: UIImage(systemName: "plus.circle")!,
                                                                    selectedImage: UIImage(systemName: "plus.circle")!,
                                                                    rootViewController: CreateContentsController())
        
        let happicReportController = templateNavigationController(title: "해픽레포트",
                                                                  unselectedImage: UIImage(systemName: "doc")!,
                                                                  selectedImage: UIImage(systemName: "doc")!,
                                                                  rootViewController: HappicReportController())
        
        let settingController = templateNavigationController(title: "설정",
                                                             unselectedImage: UIImage(systemName: "gearshape")!,
                                                             selectedImage: UIImage(systemName: "gearshape")!,
                                                             rootViewController: SettingController())
        
        viewControllers = [homeController, haruHappicController, createContentsController, happicReportController, settingController]
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        
    }
    
    private func setDelegate() {
        self.delegate = self
    }
    
    private func setActionSheet() {
        let actionSheet = UIAlertController(title: "사진을 추가하세요", message: nil, preferredStyle: .actionSheet)
    
        let cameraAction = UIAlertAction(title: "카메라", style: .default) { _ in
            
        }
        
        let photoLibraryAction = UIAlertAction(title: "사진첩", style: .default) { _ in
            
        }

        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true)
    }
    
    func templateNavigationController(title: String,
                                      unselectedImage: UIImage,
                                      selectedImage: UIImage,
                                      rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.isHidden = true
        return nav
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2 {
            setActionSheet()
            return false
        }
        return true
    }
}
