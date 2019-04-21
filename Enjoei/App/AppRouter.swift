import UIKit

class AppRouter {
  
  func buildTabBar() -> UITabBarController {
    
    let tabBarController = UITabBarController()
    
    let homeNavigationController = UINavigationController()
    let homeViewController = HomeRouter().buildModule()
    homeViewController.tabBarItem = UITabBarItem(title: "home", image: UIImage(named: "tab_home_disable"), selectedImage: UIImage(named: "tab_home_enable"))
    homeNavigationController.viewControllers = [homeViewController]
    
    let searchViewController = SearchViewController()
    searchViewController.tabBarItem = UITabBarItem(title: "buscar", image: UIImage(named: "tab_search_disable"), selectedImage: UIImage(named: "tab_search_enable"))
    
    let uploadViewController = UploadViewController()
    uploadViewController.tabBarItem = UITabBarItem(title: "upload", image: UIImage(named: "tab_upload_disable"), selectedImage: UIImage(named: "tab_upload_enable"))
    
    let inboxViewController = InboxViewController()
    inboxViewController.tabBarItem = UITabBarItem(title: "mensagens", image: UIImage(named: "tab_inbox_disable"), selectedImage: UIImage(named: "tab_inbox_enable"))
    
    let profileViewController = ProfileViewController()
    profileViewController.tabBarItem = UITabBarItem(title: "profile", image: UIImage(named: "tab_profile_disable"), selectedImage: UIImage(named: "tab_profile_enable"))
    
    tabBarController.tabBar.tintColor = .tabBarIcons
    tabBarController.viewControllers = [homeNavigationController, searchViewController, uploadViewController, inboxViewController, profileViewController]
    return tabBarController
  }
  
}
