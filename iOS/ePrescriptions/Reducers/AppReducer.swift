import ReSwift
import ReSwiftRouter

func appReducer(action: Action, state: State?) -> State {
    return State(
        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState)
    )
}
