
enum PhotosBaseUrlEnum: String {
  case size180x180 = "https://photos.enjoei.com.br/public/180x180/"
  case size_460x460 = "https://photos.enjoei.com.br/public/460x460/"
  case size_800x800 = "https://photos.enjoei.com.br/public/800x800/"
  case size_828x186 = "https://photos.enjoei.com.br/public/828x186/"
  case size_1100xN = "https://photos.enjoei.com.br/public/1100xN/"
}

enum TypeFetchProductsEnum: String {
  case initial
  case pagination
  case pullToRefresh
}
