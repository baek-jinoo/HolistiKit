import XCTest
@testable import FringesExample

class FringesTest: XCTestCase {

    // retain the window, as AppDelegate would
    private(set) var window: SpecWindow!
    
    override func setUp() {
        super.setUp()

        window = SpecWindow()
        let dashboardNavigationControllerFactory = SpecDashboardNavigationControllingFactory()
        let dashboardViewControllerFactory = SpecDashboardViewControllingFactory()
        let settingsViewControllerFactory = SpecSettingsViewControllerFactory()
        let appCoordinator = AppCoordinator(dashboardNavigationControllerFactory: dashboardNavigationControllerFactory,
                                            dashboardViewControllerFactory: dashboardViewControllerFactory,
                                            settingsViewControllerFactory: settingsViewControllerFactory)
        
        appCoordinator.didFinishLaunching(withWindow: window)
    }
}

extension FringesTest {

    var dashboardNav: SpecDashboardNavigationControllerUI! {
        return window.topViewController as! SpecDashboardNavigationControllerUI
    }

    var dashboard: SpecDashboardViewControllerUI! {
        return window.topViewController as! SpecDashboardViewControllerUI
    }

    var settings: SpecSettingsViewControllerUI! {
        return window.topViewController as! SpecSettingsViewControllerUI
    }
}
