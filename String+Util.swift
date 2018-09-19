//
//  String+Util.swift

import Foundation

extension String {
    static func emptyIfNil(_ optionalString: String?) -> String {
    let text: String
        if let unwrapped = optionalString {
            text = unwrapped
        } else {
            text = ""
        }
        return text
    }
}
//MARK:- URL to Image

extension UIImageView{
    
    func imageforurl(url:String){
        let get = URL.init(string: url)
        URLSession.shared.dataTask(with: get!, completionHandler: call).resume()
        
    }
    func call (data:Data?,response:URLResponse?,err:Error?)
    {
        if data != nil{
            
            DispatchQueue.main.async(execute: {
                self.image = UIImage.init(data: data!)
            })
            
        }
        
    }
    
}
