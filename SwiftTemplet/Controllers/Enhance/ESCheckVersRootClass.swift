//
//	ESCheckVersRootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import HandyJSON

@objcMembers
class ESCheckVersRootClass: NSObject, HandyJSON{

	var resultCount : Int = 0
	var results : [ESCheckVersResult]?

	///	implement an empty initializer.
	required override init(){
	}

	///	HandyJSON - Comment out does not need to convert.
	func mapping(mapper: HelpingMapper)	{
//		mapper <<< resultCount <-- "resultCount"
//		mapper <<< results <-- "results"
		
	}

}
