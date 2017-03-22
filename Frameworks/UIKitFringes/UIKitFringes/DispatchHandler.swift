import Foundation

public protocol DispatchHandling {
    
    func sync(on: DispatchQueue, block: @escaping () -> Void)
    func async(on: DispatchQueue, block: @escaping () -> Void)
}

public class DispatchHandler {

    public init() { }

    public func sync(on queue: DispatchQueue, block: @escaping () -> Void) {
        queue.sync(execute: block)
    }

    public func async(on queue: DispatchQueue, block: @escaping () -> Void) {
        queue.async(execute: block)
    }
}
