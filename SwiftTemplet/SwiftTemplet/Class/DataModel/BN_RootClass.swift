//
//	BN_RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class BN_RootClass : NSObject, Mappable{

	var msg : String?
	var result : BN_Result?
	var status : Int?


//    class func newInstance(map: Map) -> Mappable?{
//        return BN_RootClass()
//    }
	required init?(map: Map){}

	func mapping(map: Map)
	{
		msg <- map["msg"]
		result <- map["result"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         msg = aDecoder.decodeObject(forKey: "msg") as? String
         result = aDecoder.decodeObject(forKey: "result") as? BN_Result
         status = aDecoder.decodeObject(forKey: "status") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if msg != nil{
			aCoder.encode(msg, forKey: "msg")
		}
		if result != nil{
			aCoder.encode(result, forKey: "result")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
