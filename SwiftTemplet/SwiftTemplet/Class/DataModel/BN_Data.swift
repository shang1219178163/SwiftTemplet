//
//	BN_Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class BN_Data : NSObject, Mappable{

	var createdAt : String?
	var newsCreateTime : String?
	var newsId : String?
	var newsImage : String?
	var newsLink : String?
	var newsNum : Int?
	var newsSource : String?
	var newsTitle : String?
	var newsType : String?
	var newsTypeName : String?
	var objectId : String?
	var updatedAt : String?


//    class func newInstance(map: Map) -> Mappable?{
//        return BN_Data()
//    }
	required init?(map: Map){}

	func mapping(map: Map)
	{
		createdAt <- map["createdAt"]
		newsCreateTime <- map["newsCreateTime"]
		newsId <- map["newsId"]
		newsImage <- map["newsImage"]
		newsLink <- map["newsLink"]
		newsNum <- map["newsNum"]
		newsSource <- map["newsSource"]
		newsTitle <- map["newsTitle"]
		newsType <- map["newsType"]
		newsTypeName <- map["newsTypeName"]
		objectId <- map["objectId"]
		updatedAt <- map["updatedAt"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
         newsCreateTime = aDecoder.decodeObject(forKey: "newsCreateTime") as? String
         newsId = aDecoder.decodeObject(forKey: "newsId") as? String
         newsImage = aDecoder.decodeObject(forKey: "newsImage") as? String
         newsLink = aDecoder.decodeObject(forKey: "newsLink") as? String
         newsNum = aDecoder.decodeObject(forKey: "newsNum") as? Int
         newsSource = aDecoder.decodeObject(forKey: "newsSource") as? String
         newsTitle = aDecoder.decodeObject(forKey: "newsTitle") as? String
         newsType = aDecoder.decodeObject(forKey: "newsType") as? String
         newsTypeName = aDecoder.decodeObject(forKey: "newsTypeName") as? String
         objectId = aDecoder.decodeObject(forKey: "objectId") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "createdAt")
		}
		if newsCreateTime != nil{
			aCoder.encode(newsCreateTime, forKey: "newsCreateTime")
		}
		if newsId != nil{
			aCoder.encode(newsId, forKey: "newsId")
		}
		if newsImage != nil{
			aCoder.encode(newsImage, forKey: "newsImage")
		}
		if newsLink != nil{
			aCoder.encode(newsLink, forKey: "newsLink")
		}
		if newsNum != nil{
			aCoder.encode(newsNum, forKey: "newsNum")
		}
		if newsSource != nil{
			aCoder.encode(newsSource, forKey: "newsSource")
		}
		if newsTitle != nil{
			aCoder.encode(newsTitle, forKey: "newsTitle")
		}
		if newsType != nil{
			aCoder.encode(newsType, forKey: "newsType")
		}
		if newsTypeName != nil{
			aCoder.encode(newsTypeName, forKey: "newsTypeName")
		}
		if objectId != nil{
			aCoder.encode(objectId, forKey: "objectId")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updatedAt")
		}

	}

}
