import UIKit
import ReSwift
import ReSwiftRouter

final class MainViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var prescriptions: [Prescription] = Prescription.fakeData()
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(PrescriptionCell.self, forCellReuseIdentifier: "PrescriptionCell")
        tv.rowHeight = UITableViewAutomaticDimension
        tv.estimatedRowHeight = 100
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    private let leftLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .hex(0xcccccc)
        return v
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        view.backgroundColor = .white
        
        view.addSubview(leftLineView)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setupConstraints() {
        // MARK: Left line
        leftLineView.translatesAutoresizingMaskIntoConstraints = false
        leftLineView.widthAnchor.constraint(equalToConstant: 3).isActive = true
        leftLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        leftLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        leftLineView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // MARK: TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell") as! PrescriptionCell
        cell.setup(prescriptions[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPrescription = prescriptions[indexPath.row]
        let newRoute = [Route.main, Route.prescriptionDetails]
        
        let routeAction = SetRouteAction(newRoute)
        let setDataAction = SetRouteSpecificData(route: newRoute, data: selectedPrescription)
     
        store.dispatch(setDataAction)
        store.dispatch(routeAction)
    }
}
