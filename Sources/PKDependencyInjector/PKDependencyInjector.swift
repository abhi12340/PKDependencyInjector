

public final class PKDependencyInjector {
    public static let sharedInstance = PKDependencyInjector()
    var container: Container
    private init() {
        container = Container()
    }
}
