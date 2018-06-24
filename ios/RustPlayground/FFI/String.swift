import Foundation

extension String {
    init?(rustString rstr: RustByteSlice) {
        self.init(bytes: UnsafeBufferPointer(start: rstr.bytes, count: rstr.len), encoding: .utf8)
    }
}
