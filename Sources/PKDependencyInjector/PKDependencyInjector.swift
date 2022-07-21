

public final class PKDependencyInjector {
    public static let sharedInstance = PKDependencyInjector()
    public var container: Container 
    private init() {
        container = Container()
    }
}
