import SwiftUI
import SwiftData
import UniformTypeIdentifiers

extension Item: Transferable {
    public static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.id)
    }
}

extension UTType {
    static var item: UTType { UTType(exportedAs: "com.yourapp.item") }
} 