//
//  HomeView.swift
//  Atlastefem
//
//  Created by Jmorgaz on 12/12/20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                viewModel.updateSession()
            })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
