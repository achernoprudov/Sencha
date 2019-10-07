
/// Abstract tester for tests.
///
/// Aggregate common ui test utility functions.
public class SenchaTester: Sencha {

    private var window : UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    public func speedUp() {
        window.layer.speed = 10.0
    }
    
    public func open(
        viewController: UIViewController,
        modally: Bool = false,
        embedInNavigation: Bool = false
    ) {
        var viewControllerToOpen = viewController
        if embedInNavigation {
            viewControllerToOpen = embedInNavigationController(viewController)
        }
        
        if modally {
            window.set(rootViewController: UIViewController())
            window.rootViewController?.present(viewControllerToOpen, animated: true, completion: nil)
        } else {
            window.set(rootViewController: viewControllerToOpen)
        }
    }
    
    public func waitToBeVisible(viewControllerType: UIViewController.Type) {
        let condition = SenchaViewControllerCondition(window: window)
        condition.waitToBeVisible(viewControllerType)
    }

    private func embedInNavigationController(_ viewController: UIViewController) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}
