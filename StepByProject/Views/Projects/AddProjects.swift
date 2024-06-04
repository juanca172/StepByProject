//
//  AddProjects.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 31/05/24.
//

import SwiftUI

struct AddProjects: View {
    @State var nombreProyecto = ""
    @State var plantillaEscogida = "Scrum"
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextField("Nombre del proyecto", text: $nombreProyecto)
                    .padding()
                GroupBox {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Plantilla del proyecto")
                                .font(.caption)
                            Text("\(plantillaEscogida)")
                                .font(.title3)
                        }
                        Spacer()
                        Image(systemName: "tray.full.fill")
                    }
                }
                .padding()
                .contextMenu(
                    ContextMenu(menuItems: {
                        Button("Scrum") {
                            plantillaEscogida = "Scrum"
                        }
                        Button("Kanban") {
                            plantillaEscogida = "Kanban"
                        }
                    }
                ))
            }
            VStack(alignment: .center) {
                Button("Agregar proyecto") {
                }
                .padding()
                .clipShape(.capsule, style: FillStyle())
                .font(.headline)
                .bold()
                .background(Color.red)
            }
            .navigationTitle("Agregar proyecto")
        }
    }
}

#Preview {
    AddProjects()
}
