import XCTest
@testable import FringesExample

class FringesTest: XCTestCase {

    private(set) var appDelegate: SpecAppDelegate!
    
    override func setUp() {
        super.setUp()
        appDelegate = SpecAppDelegate()
    }
}

// MARK: App Launching, Backgrounding, Killing, etc.
extension FringesTest {

    func tapAppIcon() {
        appDelegate.applicationDidLaunch()
    }
}

// MARK: Time
extension FringesTest {

    func progress(seconds: Int = 0) {
        appDelegate.dateProvider.progress(seconds: seconds)
    }
}

// MARK: Network
extension FringesTest {

    func respond(to urlRequest: SpecNetworkRequestService.RequestURL, with response: NetworkRequestService.Response) {
        networkRequestService.respond(to: urlRequest, with: response)
    }

    private var networkRequestService: SpecNetworkRequestService {
        return appDelegate.networkRequestService
    }
}

extension FringesTest {

    var networkActivityIndicatorIsVisible: Bool {
        return sharedApplication.isNetworkActivityIndicatorVisible
    }

    private var sharedApplication: ApplicationProtocol {
        return appDelegate.sharedApplication
    }
}

// MARK: Top View Controller Accessing
extension FringesTest {

    var window: SpecWindow {
        guard let window = appDelegate.window else {
            fatalError("There is no window. Did you forget to launch the app?")
        }
        return window
    }

    private func topViewController<I>(as interface: I.Type) -> I {
        if let top = window.topViewController as? I {
            return top
        }
        let currentViewControllerStack = window.viewControllerStack
            .enumerated()
            .map { "[\($0)] [\($1)]" }
            .joined(separator: "\n")
        fatalError("\nThe top view controller was not an instance of [\(I.self)]\n" +
            "This is the current view controller stack:\n" +
            "\(currentViewControllerStack)\n" +
            "[-] Window\n")
    }

    var examples: SpecExamplesViewControllerUI! {
        return topViewController(as: SpecExamplesViewControllerUI.self)
    }

    var date: SpecDateViewControllerUI! {
        return topViewController(as: SpecDateViewControllerUI.self)
    }

    var timer: SpecTimerViewControllerUI! {
        return topViewController(as: SpecTimerViewControllerUI.self)
    }

    var networkRequestView: SpecNetworkRequestViewControllerUI! {
        return topViewController(as: SpecNetworkRequestViewControllerUI.self)
    }

    var navigationController: SpecNavigationControllerUI {
        guard let navigationController = window.topViewController.navigationController else {
            fatalError("The top view controller is not inside a navigation controller.")
        }
        return navigationController
    }
}
