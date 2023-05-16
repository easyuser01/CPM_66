//
//  CpmResultView.swift
//  CpmAnalysis
//
//

//
//
//  CpmResultView.swift
//  CpmAnalysis
//
//  Created by 김형관 on 2022/04/26.


import SwiftUI

//struct CriteriaData: Hashable, Decodable {
//    let type: String
//    let snow: Double
//    let rainfall: Double
//    let temperaturemin: Double
//    let temperaturemax: Double
//    let wind: Double
//}



struct CpmResultView: View {
    @EnvironmentObject var vm: CpmViewModel
    let atypes: [String]

    var body: some View {
        ScrollView {
            VStack {
                Text("Result:")
                    .font(.headline)
                    .padding()
                Text(vm.project.result)
                    .padding()

                ForEach(atypes, id: \.self) { atype in
                    if let criteriaDataArray = getCriteriaData(for: atype) {
                        VStack {
                            ForEach(criteriaDataArray, id: \.self) { criteriaData in
                                Text("construction type: \(atype)")
                                Text("snow: \(criteriaData.snow)")
                                Text("rainfall: \(criteriaData.rainfall)")
                                Text("temperature min: \(criteriaData.temperaturemin)")
                                Text("temperature max: \(criteriaData.temperaturemax)")
                                Text("windspeed: \(criteriaData.wind)")
                                
                            }
                        }
                        .padding()
                    } else {
                        Text("Can't find data about \(atype).")
                    }
                }
            }
            .font(.headline)
            .foregroundColor(.black)
            .padding()
        }
    }

    public func getCriteriaData(for atype: String) -> [Criteria]? {
        return CpmResultView.getCriteriaData(for: atype)
    }

    public static func getCriteriaData(for atype: String) -> [Criteria]? {
        // JSON 파일의 경로
        guard let fileURL = Bundle.main.url(forResource: "criterias", withExtension: "json") else {
            return nil
        }

        do {
            // JSON 파일 데이터를 읽어옴
            let jsonData = try Data(contentsOf: fileURL)

            // JSON 데이터를 파싱하여 Foundation 객체로 변환
            guard let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
                return nil
            }

            // atype에 해당하는 데이터를 찾음
            
                let criteriaDataArray: [Criteria] = jsonArray.compactMap { activityData in
                    if let type = activityData["name"] as? String, type == atype,
                       let id = activityData["id"] as? Int, // 수정: Int 타입으로 변경
                       let snow = activityData["snow"] as? Double,
                       let rainfall = activityData["rainfall"] as? Double,
                       let temperaturemin = activityData["temperaturemin"] as? Double,
                       let temperaturemax = activityData["temperaturemax"] as? Double,
                       let wind = activityData["wind"] as? Double {
                        return Criteria(id: id, type: type, snow: snow, rainfall: rainfall, temperaturemin: temperaturemin, temperaturemax: temperaturemax, wind: wind)
                    }
                    return nil
                }
                // ...
            


            // atype에 해당하는 데이터가 없을 경우 nil 반환
            return criteriaDataArray.isEmpty ? nil : criteriaDataArray
        } catch {
            return nil
        }
    }
}


