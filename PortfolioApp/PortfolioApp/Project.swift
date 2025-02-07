//
//  Project.swift
//  PortfolioApp
//
//  Created by srijan vikram on 2/5/25.
//


import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let githubURL: String
}

struct ProjectsView: View {
    let projects = [
        Project(name: "Time Zone Converter", image: "project1", githubURL: "https://github.com/xx-bitlegion/World-Time-Zone-Convertor"),
        Project(name: "Caesar-Cipher", image: "project2", githubURL: "https://github.com/xx-bitlegion/Caesar-Cipher"),
        Project(name: "Pricing Tag", image: "project3", githubURL: "https://github.com/yourusername/project3")
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(projects) { project in
                        ProjectCard(project: project)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("My Projects")
    }
}

struct ProjectCard: View {
    let project: Project
    
    var body: some View {
        VStack {
            Image(project.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text(project.name)
                .font(.headline)
                .padding(.top, 5)
            
            Link("View on GitHub", destination: URL(string: project.githubURL)!)
                .font(.subheadline)
                .foregroundColor(.purple)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectsView()
        }
    }
}
