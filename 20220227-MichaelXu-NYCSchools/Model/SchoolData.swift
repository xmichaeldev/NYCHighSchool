//
//  SchoolData.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/27.
//

import Foundation

struct SchoolData {
    var dbn = ""
    var school_name = ""
    var boro = ""
    var overview_paragraph = ""
    var phone_number = ""
    var fax_number = ""
    var school_email = ""
    var website = ""
}

extension SchoolData: Decodable {
    enum SchoolDataCodingKeys: String, CodingKey {
        case dbn
        case school_name
        case boro
        case overview_paragraph
        case phone_number
        case fax_number
        case school_email
        case website
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SchoolDataCodingKeys.self)
        do {
            dbn = try container.decode(String.self, forKey: .dbn)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            school_name = try container.decode(String.self, forKey: .school_name)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            boro = try container.decode(String.self, forKey: .boro)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            overview_paragraph = try container.decode(String.self, forKey: .overview_paragraph)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            phone_number = try container.decode(String.self, forKey: .phone_number)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            fax_number = try container.decode(String.self, forKey: .fax_number)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            school_email = try container.decode(String.self, forKey: .school_email)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            website = try container.decode(String.self, forKey: .website)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
