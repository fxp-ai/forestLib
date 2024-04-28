import Foundation
#if canImport(FoundationNetwork)
import FoundationNetwork
#endif

public func addNumbers(x: Int32, y: Int32) -> Int32 {
  print("I am adding \(x) and \(y)")
  return x + y
}

public func sayHello(to name: String) {
  print("Hello \(name)")
} 

public func downloadFile(urlString: String) {
  if let url = URL(string: urlString) {
    print("Downloading data from: \(url)")
    let session = URLSession.shared
    let task = session.dataTask(with: url) { data, response, error in
      if let error {
        print(error.localizedDescription)
          return
        }
        if let data, let content = String(data: data, encoding: .utf8) {
          print(content)
        }
    }
    task.resume()
  } else {
    print("Invalid URL: \(urlString)")
    return
  }
}
