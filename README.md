# VersatileUerDefaults

A property wrapper that allow objects that conform to Codable protocol to be stored in user defaults.

## Compatibility
- Swift 5.1 onwards

## Installation

Just copy the file VersatileUserDefaults.swift into your project.

## Usage

Append the declaration of any property with the attribute @VersatileUserDefaults.
Specify the user defaults key and any default value (for optional properties).
By default the standard user defaults are used, however, this may be overriden in the property wrapper initialiser to specify a different UserDefaults suite.

The attribute can be applied to any type that conforms to Codable.

## Examples

### 1. The below variable will be stored in standard user defaults with the key "some-key".
@VersatileUserDefaults(key: "some-key", defaultValue: true) var boolFoo: Bool

### 2. The below variable is an optional and will return nil if user defaults do not contain any value for the specified key ("optional-key" in this example).
@VersatileUserDefaults(key: "optional-key") var optionalText: String?

### 3. The below variable will be stored in standard user defaults with the key "some-key".
let customDefaultsSuite = UserDefaults.init(suiteName: "customDefaultsSuite")!
@VersatileUserDefaults(key: "custom-suite-key", defaultValue: "", defaults: customDefaultsSuite) var standardStringVar: String