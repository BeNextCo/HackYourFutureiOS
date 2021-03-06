// Generated using Sourcery 0.16.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

import RxSwift

@testable import hackYourFuture










private func objectDidNotCallAnyMethod(_ object: Any) -> Bool {
  let mirror = Mirror(reflecting: object)
  for case let (label?, value) in mirror.children where label.hasSuffix("CallsCount") {
    if let count = value as? Int, count > 0 {
      return false
    }
  }
  return true
}

private func objectDidNotCallAnyMethod(_ object: Any, except methodName: String) -> Bool {
  let mirror = Mirror(reflecting: object)
  for case let (label?, value) in mirror.children where label.hasSuffix("CallsCount") {
    let methodCallsCountName = methodName + "CallsCount"
    if let count = value as? Int, (label == methodCallsCountName && count == 0) || (label != methodCallsCountName && count > 0) { return false }
  }
  return true
}






class CoordinatorProtocolMock: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationControllerProtocol?

    //MARK: - start

        var startCallsCount = 0
        var startCalled: Bool {
            return startCallsCount > 0
        }
        var startCalledOnly: Bool {
            return objectDidNotCallAnyMethod(self, except: "start")
        }
        var startCalledOnlyAndOnce: Bool {
            return startCalledOnly && startCallsCount == 1
        }



    var startClosure: (() -> Void)?

    func start() {
        startCallsCount += 1
        startClosure?()
    }


    // MARK: - noMethodCalled

    var noMethodCalled: Bool {
        return objectDidNotCallAnyMethod(self)
    }

    // MARK: - Lifecycle

}
class EventListCellViewModelProtocolMock: EventListCellViewModelProtocol {
    var title: String {
        get { return underlyingTitle }
        set(value) { underlyingTitle = value }
    }
    var underlyingTitle: String!
    var imageUrl: String {
        get { return underlyingImageUrl }
        set(value) { underlyingImageUrl = value }
    }
    var underlyingImageUrl: String!
    var attendees: Int {
        get { return underlyingAttendees }
        set(value) { underlyingAttendees = value }
    }
    var underlyingAttendees: Int!
    var date: String {
        get { return underlyingDate }
        set(value) { underlyingDate = value }
    }
    var underlyingDate: String!
    var address: String {
        get { return underlyingAddress }
        set(value) { underlyingAddress = value }
    }
    var underlyingAddress: String!


    // MARK: - noMethodCalled

    var noMethodCalled: Bool {
        return objectDidNotCallAnyMethod(self)
    }

    // MARK: - Lifecycle

        init() {}

        init(title: String, imageUrl: String, attendees: Int, date: String, address: String) {
            self.title = title
            self.imageUrl = imageUrl
            self.attendees = attendees
            self.date = date
            self.address = address
        }
}
class EventListCoordinatorProtocolMock: EventListCoordinatorProtocol {


    // MARK: - noMethodCalled

    var noMethodCalled: Bool {
        return objectDidNotCallAnyMethod(self)
    }

    // MARK: - Lifecycle

}
class EventListViewModelProtocolMock: EventListViewModelProtocol {
    var cellViewModels: Observable<[EventListCellViewModelProtocol]> {
        get { return underlyingCellViewModels }
        set(value) { underlyingCellViewModels = value }
    }
    var underlyingCellViewModels: Observable<[EventListCellViewModelProtocol]>!

    //MARK: - fetchEvents

        var fetchEventsCallsCount = 0
        var fetchEventsCalled: Bool {
            return fetchEventsCallsCount > 0
        }
        var fetchEventsCalledOnly: Bool {
            return objectDidNotCallAnyMethod(self, except: "fetchEvents")
        }
        var fetchEventsCalledOnlyAndOnce: Bool {
            return fetchEventsCalledOnly && fetchEventsCallsCount == 1
        }



    var fetchEventsClosure: (() -> Void)?

    func fetchEvents() {
        fetchEventsCallsCount += 1
        fetchEventsClosure?()
    }


    // MARK: - noMethodCalled

    var noMethodCalled: Bool {
        return objectDidNotCallAnyMethod(self)
    }

    // MARK: - Lifecycle

        init() {}

        init(cellViewModels: Observable<[EventListCellViewModelProtocol]>) {
            self.cellViewModels = cellViewModels
        }
}
class UINavigationControllerProtocolMock: UINavigationControllerProtocol {

    //MARK: - pushViewController

        var pushViewControllerAnimatedCallsCount = 0
        var pushViewControllerAnimatedCalled: Bool {
            return pushViewControllerAnimatedCallsCount > 0
        }
        var pushViewControllerAnimatedCalledOnly: Bool {
            return objectDidNotCallAnyMethod(self, except: "pushViewControllerAnimated")
        }
        var pushViewControllerAnimatedCalledOnlyAndOnce: Bool {
            return pushViewControllerAnimatedCalledOnly && pushViewControllerAnimatedCallsCount == 1
        }

        var pushViewControllerAnimatedReceivedArguments: (viewController: UIViewController, animated: Bool)?
        var pushViewControllerAnimatedReceivedInvocations: [(viewController: UIViewController, animated: Bool)] = []


    var pushViewControllerAnimatedClosure: ((UIViewController, Bool) -> Void)?

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerAnimatedCallsCount += 1
        pushViewControllerAnimatedReceivedArguments = (viewController: viewController, animated: animated)
        pushViewControllerAnimatedReceivedInvocations.append((viewController: viewController, animated: animated))
        pushViewControllerAnimatedClosure?(viewController, animated)
    }


    // MARK: - noMethodCalled

    var noMethodCalled: Bool {
        return objectDidNotCallAnyMethod(self)
    }

    // MARK: - Lifecycle

}
