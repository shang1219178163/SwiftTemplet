//
//	NNResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class NNResult : NSObject, Mappable{

	var count : Int?
	var data : [NNData]?


//    class func newInstance(map: Map) -> Mappable?{
//        return NNResult()
//    }
	required init?(map: Map){}

	func mapping(map: Map)
	{
		count <- map["count"]
		data <- map["data"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [NNData]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}

	}

}
