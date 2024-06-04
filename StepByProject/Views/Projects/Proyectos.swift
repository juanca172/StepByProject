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
    var filterArray: [ProyectModel] {
        guard !coincidence.isEmpty else { return TestData.mockData }
        return TestData.mockData.filter({$0.name.localizedCaseInsensitiveContains(coincidence)})
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(filterArray, id: \.id) { elements in
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
                .sheet(isPresented: $present, content: {
                    AddProjects()
                        .presentationDetents([.large])
                })
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
                        present.toggle()
                    }
                           , label: {
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
