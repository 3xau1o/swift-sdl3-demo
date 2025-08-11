// // Extension for Optional<UnsafePointer<T>> and Optional<UnsafeMutablePointer<T>> to SDL_Result
// extension Optional<UnsafePointer<T>> {
// 	public func toSDLResult<T>(errorProvider: () -> String = { getError() ?? "Unknown SDL error" }) -> SDL_Result<T> where Wrapped == UnsafePointer<T> {
// 		switch self {
// 		case .some(let ptr):
// 			return .success(ptr)
// 		case .none:
// 			return .failure(SDL_Error(m: errorProvider()))
// 		}
// 	}
// 	public func toSDLResult<T>(errorProvider: () -> String = { getError() ?? "Unknown SDL error" }) -> SDL_Result<T> where Wrapped == UnsafeMutablePointer<T> {
// 		switch self {
// 		case .some(let ptr):
// 			return .success(ptr)
// 		case .none:
// 			return .failure(SDL_Error(m: errorProvider()))
// 		}
// 	}
// }

import Foundation

// LikeError type for Result error
// public struct SDL_Error: Error {
//     public let m: String
//     public init(m: String) { self.m = m }
// }

extension String: Error {}

public typealias SDL_Result<T> = Result<T, String>




// // Protocol for converting to SDL_Result
// public protocol XSDL_Result {
//     associatedtype Value
//     func alLikeReso() -> SDL_Result<Value>
// }

//         case .none:
//             return .failure(LikeError(getiEraro()))
//     public typealias Value = Wrapped
//     public func alLikeReso() -> LikeReso<Wrapped> {
//         switch self {
//         case .some(let value):
//             return .success(value)
//         case .none:
//             return .failure(getiEraro())
//         }
//         self ? .success(true) : .failure(LikeError(getiEraro()))
// }

// // Extension for Bool
// extension Bool: XLikeReso {
//     public typealias Value = Bool
//     public func alLikeReso() -> SDL_Result<Bool> {
//         self ? .success(true) : .failure(getiEraro())
//     }
// }

// // Extension for Result<CString, NulError> (using Swift's CString and error)
//             return .failure(LikeError(err.localizedDescription))
//     public typealias Value = String
//     public func alLikeReso() -> SDL_Result<String> {
//         switch self {
//         case .success(let str):
//             return .success(str)
//         case .failure(let err):
//             return .failure(err.localizedDescription)
//         }
//     }
// }

// // Protocol for LikeDrop
// public protocol LikeDrop: AnyObject, CustomDebugStringConvertible {
//     func dropi()
// }

// // LikePtr wrapper
// public class LikePtr<T: LikeDrop>: CustomDebugStringConvertible {
//     public var value: T

//     public init(_ value: T) {
//         self.value = value
//     }

//     deinit {
//         print("like_drop \(type(of: value)):\(value)")
//         value.dropi()
//     }

//     public var debugDescription: String {
//         "LikePtr(\(value))"
//     }
// }

// // Dummy error function (replace with your own)
// public func getiEraro() -> String {
//     "Unknown error"
// }

// // Dummy NulError for demonstration
// public struct NulError: Error {
//     public var localizedDescription: String { "NulError" }
// }