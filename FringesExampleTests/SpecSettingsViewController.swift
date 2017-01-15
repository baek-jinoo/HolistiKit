@testable import FringesExample

class SpecDateViewControllerFactory: DateViewControllerFactoryProtocol {
    
    func create(withPresenter presenter: DatePresenter) -> DateViewControlling {
        return SpecDateViewController(presenter: presenter)
    }
}

protocol SpecDateViewControllerUI {

    var dateLabel: String? { get }
}

class SpecDateViewController: SpecViewController, DateViewControlling, SpecDateViewControllerUI {

    private(set) var dateLabel: String?
    private let presenter: DatePresenting

    init(presenter: DatePresenting) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }

    func set(dateLabel text: String) {
        dateLabel = text
    }
}
