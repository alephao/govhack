import UIKit
import ReSwift
import ReSwiftRouter

class PrescriptionDetailsViewController: BaseViewController, StoreSubscriber {
    
    private let issuedByTitleLabel: UILabel = {
        let l = UILabel.subtitle15ptGray()
        l.text = "issuedBy"
        return l
    }()
    
    private let issuedByLabel = UILabel.body17ptBlack()
    
    private let dateIssuedTitleLabel: UILabel = {
        let l = UILabel.subtitle15ptGray()
        l.text = "Date issued"
        return l
    }()
    
    private let dateIssuedLabel = UILabel.body17ptBlack()
    
    var prescription: Prescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(issuedByTitleLabel)
        view.addSubview(issuedByLabel)
        view.addSubview(dateIssuedTitleLabel)
        view.addSubview(dateIssuedLabel)
        
        store.subscribe(self) { state in
            state.select { currentState in
                let currentPrescription: Prescription? = currentState
                    .navigationState
                    .getRouteSpecificState(
                        currentState.navigationState.route
                )
                
                return currentPrescription
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.unsubscribe(self)
    }
    
    override func setupConstraints() {
        
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            // Required to update the route, when this VC was dismissed through back button from
            // NavigationController, since we can't intercept the back button
            if store.state.navigationState.route == [Route.main, Route.prescriptionDetails] {
                store.dispatch(SetRouteAction([Route.main]))
            }
        }
    }
    
    func newState(state: Prescription?) {
        if self.prescription != state {
            self.prescription = state
            if let p = self.prescription {
                setup(prescription: p)
            }
        }
    }
    
    private func setup(prescription: Prescription) {
        self.dateIssuedLabel.text = prescription.dateIssuedString()
    }
    
}
