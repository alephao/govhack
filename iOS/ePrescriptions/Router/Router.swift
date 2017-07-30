import ReSwift
import ReSwiftRouter

struct Route {
    static let main: RouteElementIdentifier = "Main"
    static let prescriptionDetails: RouteElementIdentifier = "PrescriptionDetals"
}

final class RootRoutable: Routable {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setToMainViewController() -> Routable {
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        self.window.rootViewController = navigationController
        
        return MainViewRoutable(navigationController)
    }
    
    func changeRouteSegment(_ from: RouteElementIdentifier,
                            to: RouteElementIdentifier,
                            animated: Bool,
                            completionHandler: @escaping RoutingCompletionHandler
        ) -> Routable {
        
        if to == Route.main {
            completionHandler()
            return self.setToMainViewController()
        } else {
            fatalError("Route not supported! (change)")
        }
    }
    
    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                          animated: Bool,
                          completionHandler: @escaping RoutingCompletionHandler
        ) -> Routable {
        
        if routeElementIdentifier == Route.main {
            completionHandler()
            return self.setToMainViewController()
        } else {
            fatalError("Route not supported! (push)")
        }
    }
    
    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                         animated: Bool,
                         completionHandler: @escaping RoutingCompletionHandler) {
        completionHandler()
        fatalError("This should technically never be callled -> bug in router")
    }
}

class MainViewRoutable: Routable {
    
    let viewController: UINavigationController
    
    init(_ viewController: UINavigationController) {
        self.viewController = viewController
    }
    
    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                          animated: Bool,
                          completionHandler: @escaping RoutingCompletionHandler
        ) -> Routable {
        if routeElementIdentifier == Route.prescriptionDetails {
            let prescriptionDetailsViewController = PrescriptionDetailsViewController()
            viewController.pushViewController(prescriptionDetailsViewController, animated: true)
            completionHandler()
            return PrescriptionDetailsRoutable()
        } else {
            fatalError("Route could not proceed")
        }
    }
    
    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier,
                         animated: Bool,
                         completionHandler: @escaping RoutingCompletionHandler) {
        completionHandler()
    }
}

class PrescriptionDetailsRoutable: Routable { }
