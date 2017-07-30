import ReSwift

struct AuthenticationState {
    var loggedInState: LoggedInState
}

enum LoggedInState {
    case loggedIn(String)
    case notLoggedIn
}
