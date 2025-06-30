//
//MIT License
//
//Copyright © 2025 Cong Le
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//
//
//  IITOverviewView_with_citations.swift
//  Information_Integration_Theory
//
//  Created by Cong Le on 6/29/25.
//

import SwiftUI

// MARK: - Color Palette
extension Color {
    // Custom colors for better visual distinction in the view.
    // These are adaptive for Light and Dark mode.
    static let theoryAccent = Color(red: 0.1, green: 0.4, blue: 0.7) // A professional, deep blue.
    static let quantityColor = Color.blue.opacity(0.8)
    static let qualityColor = Color.purple.opacity(0.8)
    static let cardBackground = Color(.secondarySystemGroupedBackground)
}

// MARK: - Data Models
// These structs define the content for the view, separating data from presentation.

/// Represents one of the two main problems of consciousness, as defined by IIT.
///
/// The framework of quantity (Φ) versus quality (qualia space) is central to the theory.
/// - Source: Tononi, G. (2004). "An Information Integration Theory of Consciousness."
struct Problem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let keyQuestion: String
    let solution: String
    let icon: String
    let color: Color
}

/// Represents a core concept of IIT, derived from phenomenological analysis.
/// - Source: Tononi, G. (2004).
struct Concept: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
}

/// Represents a key definition within IIT's formal framework.
struct Definition: Identifiable {
    let id = UUID()
    let term: String
    let explanation: String
    let icon: String
}

/// Represents a key implication derived from the theory's axioms.
/// - Source: Tononi, G. (2004), "Implications of the hypothesis" section.
struct Implication: Identifiable {
    let id = UUID()
    let text: String
    let icon: String
}

/// Represents a single, formatted academic reference.
struct Reference: Identifiable {
    let id = UUID()
    let shortName: String
    let fullCitation: String
}


// MARK: - MAIN VIEW: IITOverviewView
/**
 A SwiftUI view that provides a comprehensive and referenced overview of the Information Integration Theory (IIT) of consciousness.

 This view explains the core tenets of IIT, including the two main problems it addresses (quantity and quality of consciousness), its fundamental concepts, key definitions, major implications, and a list of primary academic sources. The implementation follows SwiftUI best practices by using componentized subviews and data-driven models.
 
 All content is supported by citations from peer-reviewed scientific literature.
*/
struct IITOverviewView: View {
    
    // MARK: - Data Properties
    
    /// The two foundational problems IIT aims to solve.
    /// - Source: Tononi (2004).
    private let problems: [Problem] = [
        .init(title: "Quantity of Consciousness",
              subtitle: "The Level of Experience",
              keyQuestion: "Why are we conscious in wakefulness but not in dreamless sleep?",
              solution: "Measured by Φ (Phi): a system's capacity to integrate information.",
              icon: "ruler.fill",
              color: .quantityColor),
        .init(title: "Quality of Consciousness",
              subtitle: "The Content of Experience",
              keyQuestion: "Why does 'red' feel different from the sound of a 'trumpet'?",
              solution: "Determined by Qualia Space: the 'shape' of a system's informational relationships.",
              icon: "paintpalette.fill",
              color: .qualityColor)
    ]

    /// The core phenomenological concepts of information and integration.
    /// - Source: Tononi (2004).
    private let concepts: [Concept] = [
        .init(title: "Differentiation",
              description: "A system must have a large repertoire of available states. This represents the 'Information' aspect.",
              icon: "square.grid.3x3.topleft.filled"),
        .init(title: "Integration",
              description: "The system must be a unified whole, unable to be broken down into independent parts. This ensures the experience is unified.",
              icon: "circle.grid.3x3.circle.fill")
    ]

    /// Key mathematical and conceptual terms of IIT.
    /// - 'Φ' source: Tononi & Sporns (2003).
    /// - 'Complex' and 'Qualia Space' source: Tononi (2004).
    private let definitions: [Definition] = [
        .init(term: "Φ (Phi)",
              explanation: "The measure of a system's integrated information. A non-zero Φ is required for consciousness.",
              icon: "measure.fill"),
        .init(term: "Complex",
              explanation: "A subset of elements that has Φ > 0 and is not part of a larger subset with higher Φ. This is the substrate of consciousness.",
              icon: "brain.head.profile"),
        .init(term: "Qualia Space",
              explanation: "The abstract space defined by all the informational relationships within a complex. Its structure determines the 'quality' of experience.",
              icon: "cube")
    ]
    
    /// Key implications drawn from the theory's framework.
    /// - Source: Tononi (2004).
    private let implications: [Implication] = [
        .init(text: "Consciousness is graded, not all-or-nothing.", icon: "chart.bar.xaxis"),
        .init(text: "Consciousness is widespread in the animal kingdom.", icon: "tortoise.fill"),
        .init(text: "It is theoretically possible to build conscious artifacts.", icon: "cpu.fill"),
        .init(text: "The brain's substrate for consciousness is a 'Dynamic Core'.", icon: "arrow.triangle.2.circlepath.circle.fill")
    ]
    
    /// The primary academic sources for the content presented in this view.
    private let references: [Reference] = [
        .init(shortName: "Tononi 2004", fullCitation: """
        Tononi, Giulio. 2004. “An Information Integration Theory of Consciousness.” *BMC Neuroscience* 5 (1): 42. https://doi.org/10.1186/1471-2202-5-42.
        """),
        .init(shortName: "Tononi & Sporns 2003", fullCitation: """
        Tononi, Giulio, and Olaf Sporns. 2003. “Measuring Information Integration.” *BMC Neuroscience* 4 (1): 31. https://doi.org/10.1186/1471-2202-4-31.
        """),
        .init(shortName: "Tononi & Edelman 1998", fullCitation: """
        Tononi, Giulio, and Gerald M. Edelman. 1998. “Consciousness and Complexity.” *Science* 282 (5395): 1846–51. https://doi.org/10.1126/science.282.5395.1846.
        """)
    ]

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                // --- Header ---
                headerView
                
                // --- Two Problems Section ---
                SectionHeader(title: "The Two Problems of Consciousness")
                ForEach(problems) { problem in ConceptCard(problem: problem) }

                // --- Core Concepts Section ---
                SectionHeader(title: "Core Concepts")
                HStack(spacing: 16) {
                    ForEach(concepts) { concept in CoreConceptView(concept: concept) }
                }.padding(.horizontal)
                
                // --- Key Definitions Section ---
                SectionHeader(title: "Key Definitions")
                VStack(spacing: 16) {
                    ForEach(definitions) { definition in DefinitionView(definition: definition) }
                }.padding(.horizontal)
                
                // --- Implications Section ---
                SectionHeader(title: "Major Implications")
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(implications) { implication in ImplicationRowView(implication: implication) }
                }.padding(.horizontal)

                // --- References Section ---
                SectionHeader(title: "References")
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(references) { reference in ReferenceView(reference: reference) }
                }.padding([.horizontal, .top])
                
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationTitle("IIT Overview")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Information Integration Theory")
                .font(.largeTitle).bold()
                .foregroundColor(.primary)
            Text("An Overview of Consciousness as Integrated Information")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
        }
        .padding(.horizontal)
    }
}

// MARK: - Subviews

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title).font(.title2).bold().padding(.horizontal).foregroundColor(.primary)
    }
}

struct ConceptCard: View {
    let problem: Problem
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: problem.icon).font(.title).foregroundColor(problem.color).frame(width: 44, height: 44).background(problem.color.opacity(0.15)).clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(problem.title).font(.headline).bold()
                    Text(problem.subtitle).font(.subheadline).foregroundColor(.secondary)
                }
                Spacer()
            }
            Divider()
            VStack(alignment: .leading, spacing: 8) {
                Text(problem.keyQuestion).font(.body).italic().foregroundColor(.secondary)
                Label(problem.solution, systemImage: "lightbulb.fill").font(.body.weight(.semibold)).foregroundColor(problem.color)
            }
        }
        .padding().background(Color.cardBackground).cornerRadius(16).shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4).padding(.horizontal)
        .accessibilityElement(children: .combine).accessibilityLabel("\(problem.title). Key question: \(problem.keyQuestion). Solution: \(problem.solution)")
    }
}

struct CoreConceptView: View {
    let concept: Concept
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: concept.icon).font(.system(size: 36, weight: .light)).foregroundColor(.theoryAccent)
            Text(concept.title).font(.headline)
            Text(concept.description).font(.caption).foregroundColor(.secondary).multilineTextAlignment(.center).frame(minHeight: 60, alignment: .top)
        }
        .padding().frame(maxWidth: .infinity).background(Color.cardBackground).cornerRadius(16)
        .accessibilityElement(children: .combine).accessibilityLabel("\(concept.title). \(concept.description)")
    }
}

struct DefinitionView: View {
    let definition: Definition
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: definition.icon).font(.title).foregroundColor(.theoryAccent).frame(width: 44)
            VStack(alignment: .leading) {
                Text(definition.term).font(.headline).bold()
                Text(definition.explanation).font(.subheadline).foregroundColor(.secondary)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ImplicationRowView: View {
    let implication: Implication
    var body: some View {
        Label { Text(implication.text).font(.body) } icon: { Image(systemName: implication.icon).foregroundColor(.theoryAccent) }
    }
}

/// A view specifically for displaying a formatted academic reference.
struct ReferenceView: View {
    let reference: Reference
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(reference.shortName)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(try! AttributedString(markdown: reference.fullCitation.replacingOccurrences(of: "“", with: "*").replacingOccurrences(of: "”", with: "*")))
                .font(.footnote)
                .foregroundColor(.secondary)
                .lineSpacing(4)
            
            // Extract the URL and create a link if possible
            if let urlString = reference.fullCitation.components(separatedBy: " ").last, let url = URL(string: urlString) {
                Link(destination: url) {
                    Label("View Source", systemImage: "link.circle.fill")
                        .font(.caption.weight(.bold))
                }
                .padding(.top, 2)
            }
        }
    }
}



// MARK: - Preview Provider
struct IITOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IITOverviewView()
        }
        .preferredColorScheme(.light)
        
        NavigationView {
            IITOverviewView()
        }
        .preferredColorScheme(.dark)
    }
}
