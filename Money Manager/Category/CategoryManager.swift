//
//  CategoryManager.swift
//  Money Manager
//
//  Created by TaLi on 12/30/21.
//

import Foundation
class CategoryManager {
    var expenseCategories: [CategoryFilter] = []
    var incomeCategory: [CategoryFilter] = []
    static let shared: CategoryManager = {
        let instance = CategoryManager()
        // setup code
        return instance
    }()
    init() {
        self.expenseCategories = CategoryFilter.getExpenseCategory()
        self.incomeCategory = CategoryFilter.getIncomeCategory()
    }
}
