//
//  ContentView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridClms: Int = 1
    @State private var gridIcon: String = "square.grid.2x2"
    
    
    // Method to change the grid Items
    
    func gridSwitcher() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridClms = gridLayout.count
        }
        switch gridClms {
        case 1:
            gridIcon = "square.grid.2x2"
        case 2:
            gridIcon = "square.grid.3x2"
        case 3:
            gridIcon = "rectangle.grid.1x2"
            
        default:
            gridIcon = "square.grid.2x2"
        }
    }
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animalDetail: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animalDetail: animal)) {
                                    AnimalGridView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }// MARK: - List
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title3)
                                .foregroundColor(isGridViewActive ? .primary: .accentColor)
                        }
                        Button(action: {
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                            gridSwitcher()
                        }) {
                            Image(systemName: gridIcon)
                                .font(.title3)
                                .foregroundColor(isGridViewActive ? .accentColor: .primary)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }// MARK: - Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
