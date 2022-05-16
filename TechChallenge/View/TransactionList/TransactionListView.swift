//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @State private var selectedCategory = TransactionModel.Category.all
    
    var body: some View {
        VStack {
            CategoriesHeaderView(selectedCategory: $selectedCategory)
            List {
                ForEach(filterTransactions(transactions: transactions)) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
        }
    }
    
    private func filterTransactions(transactions: [TransactionModel]) -> [TransactionModel] {
        var filteredTransactions = transactions
        if (selectedCategory != TransactionModel.Category.all) {
                filteredTransactions = transactions.filter {transaction in
                    transaction.category == selectedCategory
            }
        }
        return filteredTransactions
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif