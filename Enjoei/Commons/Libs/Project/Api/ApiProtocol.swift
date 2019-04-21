
import Foundation

protocol APIProtocol: class {
  var urlInitial: URL { get }
  var urlPullRefresh: URL { get }
  var urlPagination: URL { get }
}
