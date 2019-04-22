
import Foundation
@testable import Enjoei

class APISpy: APIProtocol {
  
  var urlInitial: URL {
    return URL(string: "https://pastebin.com/raw/qdfq10ii")!
  }
  
  var urlPullRefresh: URL {
    return URL(string: "https://pastebin.com/raw/qdfq10ii")!
  }
  
  var urlPagination: URL {
    return URL(string: "https://pastebin.com/raw/qdfq10ii")!
  }
  
}
