
import Foundation

struct ProductsApiEntity: Codable {
  let discount_percentage: Int?
  let likes_count: Int?
  let photos: [ProductPhotoApiEntity]?
  let price: Float?
  let original_price_integer: Float?
  let size: String?
  let title: String?
  let user: ProductUserApiEntity?
  let default_photo: ProductPhotoApiEntity?
}
