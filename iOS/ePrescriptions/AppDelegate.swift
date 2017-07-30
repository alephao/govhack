import ReSwift
import ReSwiftRouter

fileprivate let loggingMiddleware: Middleware<State> = { dispatch, getState in
    return { next in
        return { action in
            print(action)
            return next(action)
        }
    }
}

let store = Store<State>(reducer: appReducer, state: nil, middleware: [loggingMiddleware])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router<State>!

    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = SplashViewController()
        
        let rootRoutable = RootRoutable(window: window)
        
        router = Router(store: store, rootRoutable: rootRoutable) { state in
            state.select { $0.navigationState }
        }
        
        store.dispatch(SetRouteAction([Route.main]))
        
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }

}

