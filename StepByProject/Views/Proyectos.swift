//
//  Proyectos.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 31/05/24.
//

import SwiftUI

struct Proyectos: View {
    var body: some View {
        NavigationStack {            
            List {
                ForEach(0..<49) { value in
                    Text("\(value)")
                }
            }
            .navigationTitle("Proyectos")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .colorInvert()
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
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
