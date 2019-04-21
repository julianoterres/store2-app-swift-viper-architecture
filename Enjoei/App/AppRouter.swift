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
    profileViewController.tabBarItem = UITabBarItem(title: "perfil", image: UIImage(named: "tab_profile_disable")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_profile_enable")?.withRenderingMode(.alwaysOriginal))
    
    tabBarController.tabBar.tintColor = .tabBarIcons
    tabBarController.viewControllers = [homeNavigationController, searchViewController, uploadViewController, inboxViewController, profileViewController]
    
    return tabBarController
  }
  
}


//let tabFoll = tabbar.items![1]
//tabFoll.title = "Followed"
//tabFoll.image=UIImage(named: "icon_fold.png")?.withRenderingMode(.alwaysOriginal)
//tabFoll.selectedImage=UIImage(named: "icon_fold.png")?.withRenderingMode(.alwaysOriginal)
//tabFoll.titlePositionAdjustment.vertical = tabFoll.titlePositionAdjustment.vertical-4
