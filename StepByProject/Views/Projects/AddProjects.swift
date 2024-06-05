//
//  AddProjects.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 31/05/24.
//

import SwiftUI

struct AddProjects: View {
    @State var nombreProyecto = ""
    @State var plantillaEscogida: KindOfProyect = .Scrum
    @State var presentTitle = false
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
                            plantillaEscogida = .Scrum
                        }
                        Button("Kanban") {
                            plantillaEscogida = .Kanban
                        }
                    }
                ))
            }
            VStack(alignment: .center) {
                Button("Agregar proyecto") {
                    guard !nombreProyecto.isEmpty else {  presentTitle = true; return }
                    let proyect = ProyectModel(name: nombreProyecto, image: "tray.full.fill", kind: plantillaEscogida )
                }
                .padding()
                .clipShape(.capsule, style: FillStyle())
                .font(.headline)
                .bold()
                .foregroundStyle(.black)
                .background(Color.red)
            }
            .alert("Form error", isPresented: $presentTitle, presenting: "Please fill the form") 
                    { message in
                        Button("Confirm") {
                            print("Confirmed: \(message)")
                        }
                        Button("Cancel", role: .cancel) {}
                    } message: { message in
                            Text(message)
                    }
            .navigationTitle("Agregar proyecto")
        }
    }
}

#Preview {
    AddProjects()
}
