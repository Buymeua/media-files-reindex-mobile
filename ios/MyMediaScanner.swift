import Photos

@objc(MyMediaScanner)
class MyMediaScanner: NSObject {

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }

      @objc func scanFile(_ path: String) {
          let fileURL = URL(fileURLWithPath: path)
          PHPhotoLibrary.shared().performChanges({
              PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: fileURL)
          }) { success, error in
              if success {
                  print("File added to gallery.")
              } else if let error = error {
                  print("Failed to add file: \(error)")
              }
          }
      }

      @objc
      static func requiresMainQueueSetup() -> Bool {
          return true
      }
}
