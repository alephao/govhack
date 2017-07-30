import Foundation

fileprivate let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "dd/MM/yyyy"
    return df
}()

struct Prescription {
    var id: String
    var dateIssued: Date
    var prescriber: Prescriber
    var drugs: [DrugPrescribed]
    
    func dateIssuedString() -> String {
        return dateFormatter.string(from: dateIssued)
    }
    
    static func fakeData() -> [Prescription] {
        let prescriber = Prescriber()
        
        return [
            Prescription(id: "0",
                         dateIssued: Date(),
                         prescriber: prescriber,
                         drugs: []),
            Prescription(id: "1",
                         dateIssued: Date(),
                         prescriber: prescriber,
                         drugs: []),
            Prescription(id: "2",
                         dateIssued: Date(),
                         prescriber: prescriber,
                         drugs: []),
            Prescription(id: "3",
                         dateIssued: Date(),
                         prescriber: prescriber,
                         drugs: []),
        ]
    }
}

extension Prescription: Equatable { }
func ==(lhs: Prescription, rhs: Prescription) -> Bool {
    return lhs.id == rhs.id
}
