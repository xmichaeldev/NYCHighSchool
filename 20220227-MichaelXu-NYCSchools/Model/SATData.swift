//
//  SchoolData.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/27.
//

import Foundation

struct SATData {
    var dbn = ""
    var school_name = ""
    var num_of_sat_test_takers = ""
    var sat_critical_reading_avg_score = ""
    var sat_math_avg_score = ""
    var sat_writing_avg_score = ""
}

extension SATData: Decodable {
    enum SATDataCodingKeys: String, CodingKey {
        case dbn
        case school_name
        case num_of_sat_test_takers
        case sat_critical_reading_avg_score
        case sat_math_avg_score
        case sat_writing_avg_score
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SATDataCodingKeys.self)
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
            num_of_sat_test_takers = try container.decode(String.self, forKey: .num_of_sat_test_takers)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            sat_critical_reading_avg_score = try container.decode(String.self, forKey: .sat_critical_reading_avg_score)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            sat_math_avg_score = try container.decode(String.self, forKey: .sat_math_avg_score)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        do {
            sat_writing_avg_score = try container.decode(String.self, forKey: .sat_writing_avg_score)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
