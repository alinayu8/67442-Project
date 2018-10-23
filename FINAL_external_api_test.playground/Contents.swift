
//import UIKit
import Foundation

//Shirley Zhou and Alina Yu 67-475 External API Test
//using quotes.rest API 

let qodURL: NSURL = NSURL(string: "https://quotes.rest/qod?category=inspire")!

let data = NSData(contentsOf: qodURL as URL)!

var results = [String]()

do {
  let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String:AnyObject]
  
  if let contents = json["contents"] as? NSDictionary {
    
    print(contents)
    if let quoteDatas = contents["quotes"] as? [NSDictionary] {
      for quoteData in quoteDatas{
        print(quoteData)
        for kvpair in quoteData {
          if let left = kvpair.0 as? String {
            if left == "quote" {
              if let right = kvpair.1 as? String {
                results.append (right)
              }
            }
            if left == "author" {
              if let right = kvpair.1 as? String {
                results.append (right)
              }
            }
          }
        }
      }
    }
  }
  
}catch {
  print("error serializing JSON: \(error)")
}

print("\n---------\n")

for elem in results {
  print(elem)
}


