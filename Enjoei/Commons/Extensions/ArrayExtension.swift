
import Foundation

extension Array {
  
  mutating func prepend(contentsOf : [Element]){
    let currentItens = self
    self = []
    self.append(contentsOf: contentsOf)
    self.append(contentsOf: currentItens)
  }
  
}
