//
//  CategoryFilter.swift
//  Money Manager
//
//  Created by TaLi on 12/30/21.
//

import Foundation
struct CategoryFilter: Codable {
    var parentCategory: Category
    var subCategories: [Category] = []
    static func getExpenseCategory() -> [CategoryFilter] {
        if let filePath = Bundle.main.url(forResource: "Expense_Category", withExtension: "json") {
                
                do {
                    let data = try Data(contentsOf: filePath)
                    let decoder = JSONDecoder()
                    let speciesList = try decoder.decode([CategoryFilter].self, from: data)
                    return speciesList
                } catch {
                    print("Can not load JSON file.")
                }
            }

        return []
    }
    static func getIncomeCategory() -> [CategoryFilter] {
        if let filePath = Bundle.main.url(forResource: "Income_Category", withExtension: "json") {
                
                do {
                    let data = try Data(contentsOf: filePath)
                    let decoder = JSONDecoder()
                    let speciesList = try decoder.decode([CategoryFilter].self, from: data)
                    return speciesList
                } catch {
                    print("Can not load JSON file.")
                }
            }
        return []
    }
}
