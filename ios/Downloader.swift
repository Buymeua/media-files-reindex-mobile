import Foundation

@objc(Downloader)
class Downloader: NSObject {

  @objc
  func downloadFile(_ url: String, outputPath: String, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
    guard let fileURL = URL(string: url) else {
      rejecter("Invalid URL", "The provided URL is invalid", nil)
      return
    }

    let task = URLSession.shared.downloadTask(with: fileURL) { (tempURL, response, error) in
      if let error = error {
        rejecter("Download Error", "Failed to download file: \(error.localizedDescription)", error)
        return
      }

      guard let tempURL = tempURL else {
        rejecter("Download Error", "Failed to download file: No temporary URL", nil)
        return
      }

      do {
        let fileData = try Data(contentsOf: tempURL)
        try fileData.write(to: URL(fileURLWithPath: outputPath))
        resolver("File downloaded successfully to \(outputPath)")
      } catch {
        rejecter("File Write Error", "Failed to write file to disk: \(error.localizedDescription)", error)
      }
    }

    task.resume()
  }
}
