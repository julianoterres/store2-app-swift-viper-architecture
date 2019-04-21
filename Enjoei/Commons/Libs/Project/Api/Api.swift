
import Foundation

class API: APIProtocol {
  
  private let baseUlr = "https://pastebin.com/raw/"
  
  var urlInitial: URL {
    return URL(string: baseUlr + "qdfq10ii")!
  }
  
  var urlPullRefresh: URL {
    return URL(string: baseUlr + "vNWpzLB9")!
  }
  
  var urlPagination: URL {
    return URL(string: baseUlr + "X2r3iTxJ")!
  }
  
}
