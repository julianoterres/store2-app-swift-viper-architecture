
import Foundation

struct ProductUserApiEntity: Codable {
  let avatar: ProductPhotoApiEntity?
  let city: String?
  let email: String?
  let gender: String?
  let id: Int?
  let name: String?
  let nickname: String?
  let state: String?
}
