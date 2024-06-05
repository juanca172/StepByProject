//
//  Proyectos.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 31/05/24.
//

import SwiftUI

struct Proyectos: View {
    @State var coincidence = ""
    @State var present = false
    var viewModel = ViewModelProjects()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filterArray, id: \.id) { elements in
                    HStack {
                        Image(systemName: elements.image)
                            .resizable()
                            .clipShape(.capsule)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("\(elements.name)")
                            Text("Scrum")
                        }
                    }
                }
            }
            .sheet(isPresented: $present,
                   content: {
                        AddProjects()
                            .presentationDetents([.large])
                })
            .onChange(of: coincidence) { oldValue, newValue in
                viewModel.rechargeFilterData(newValue)
            }
            Spacer()
            .navigationTitle("Proyectos")
            .searchable(text: $coincidence, prompt: "Search proyect")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .colorInvert()
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        present = true
                    },
                    label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    })
                }
            }
        }
        
    }
}

#Preview {
    Proyectos()
        .navigationTitle("Proyectos")
}
