import Foundation

/// This property wrapper provides a capability to store an instance
/// of any type that conforms to Codable, into the standard user defaults.
@propertyWrapper
struct VersatileUserDefaults<T: Codable> {
    private let key: String
    private let defaultValue: T
    private let defaults: UserDefaults
    
    /// Designated initialiser.
    /// - Parameters:
    ///   - key: The key used to store this item in the user defaults.
    ///   - defaultValue: The default value to return if nothing is found for the specified key.
    ///   - defaults: The UserDefaults suite to use for storage. The default is the standard singleton.
    init(key: String, defaultValue: T, defaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.defaults = .standard
    }
    
    var wrappedValue: T {
        get {
            // Read value from UserDefaults
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }
            
            // Convert data to the desired data type
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            // Convert newValue to data
            let data = try? JSONEncoder().encode(newValue)
            
            // Set value to UserDefaults
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

extension VersatileUserDefaults where T: ExpressibleByNilLiteral {
    init(key: String, defaults: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, defaults: defaults)
    }
}
