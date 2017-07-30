import Foundation

final class PrescriptionService {
    
    func fetchPrescriptions(completionHandler: @escaping ([Prescription]) -> ()) {
        // Fake req
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
            completionHandler([])
        }
    }
    
}
