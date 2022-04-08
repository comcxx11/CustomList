//
//  ContentView.swift
//  CustomList
//
//  Created by SEOJIN HONG on 2022/04/08.
//

import SwiftUI

struct ListData: Identifiable,Hashable {
    var id = UUID()
    var title: String
    var postType: Array<String>
    var date: String
    var Image: String
    var Color: Color
    var percentage: GLfloat
    var stars: Int
}

// ----------------- No Space List ---------------
extension Color {
    static let lightPink = Color(red: 236 / 255, green: 188 / 255, blue: 180 / 255)
    static let lightGray = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let lightOrange = Color(red: 219 / 255, green: 98 / 255, blue: 68 / 255)
    static let iconGray = Color(red: 112 / 255, green: 112 / 255, blue: 112 / 255)
    static let lighterPink = Color(red: 233 / 255, green: 219 / 255, blue: 210 / 255)
    static let lighterGray = Color(red: 214 / 255, green: 214 / 255, blue: 214 / 255)
}


var data = [
    ListData(title: "LazyHGrid in SwiftUI (part 1/3)", postType: ["iOS","SwiftUI", "Xcode"], date: "05 Jun", Image: "LazyGrid",Color: Color.lighterPink, percentage: 0.30, stars: 5),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.lighterGray, percentage: 0.25, stars: 4),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "20 Nov", Image: "themeDetector",Color: Color.lightOrange, percentage: 0.10, stars: 3),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "10 Jun", Image: "try1",Color: Color.lightPink, percentage: 0.45, stars: 2),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "05 Feb", Image: "themeDetector",Color: Color.lightGray, percentage: 0.86, stars: 5),
    ListData(title: "LazyHGrid in SwiftUI (part 1/3)", postType: ["iOS","SwiftUI", "Xcode"], date: "15 Dec", Image: "LazyGrid",Color: Color.lightOrange, percentage: 0.30, stars: 3),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.lighterPink, percentage: 0.25, stars: 2),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.lighterGray, percentage: 0.10, stars: 3),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "try1",Color: Color.lightGray, percentage: 0.45, stars: 4),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.lightOrange, percentage: 0.86, stars: 5)
]

struct ContentView: View {
    @State var d = data
    
    var body: some View {
        NavigationView {
            List {
                Section (header: GroupedListHeader(), footer: GroupedListFooter()) {
                    ForEach(d, id: \.self) { m in
                        VStack {
                            NavigationLink(destination: Text(m.title)) {
                                HStack {
                                    Image(m.Image)
                                        .resizable()
                                        .frame(width: 120, height: 90)
                                    VStack(alignment: .leading, spacing: 8) {
                                        tags(tags: m.postType)
                                        Text(m.title)
                                            .bold()
                                            .font(.subheadline)
                                            .lineLimit(1)
                                        Text("The Happy Programmer")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                        HStack {
                                            ProgressView(value: m.percentage)
                                                .progressViewStyle(LinearProgressViewStyle(tint: Color.pink))
                                                .foregroundColor(.red)
                                            Text(String(format: "%.0f%%", m.percentage * 100))
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }.onDelete(perform: deleteItem)
                }
//            }.listStyle(GroupedListStyle())
//            }.listStyle(DefaultListStyle())
//            }.listStyle(InsetListStyle())
//            }.listStyle(InsetGroupedListStyle())
            }.listStyle(SidebarListStyle())
                .navigationTitle("Posts")
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.d.remove(atOffsets: indexSet)
    }
}

struct GroupedListFooter: View {
    var body: some View {
        HStack {
            Image(systemName: "creditcard")
            Text("Please support me on Patreon")
        }
    }
}
struct GroupedListHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "tray.full.fill")
            Text("All Posts from The Happy Programmer")
        }
    }
}

struct tags: View {
    var tags: Array<String>
    var body: some View {
        HStack {
        ForEach(tags, id: \.self) { e in
            Text(e)
                .foregroundColor(.blue)
                .font(.system(size: 6))
                .padding(4)
                .overlay(
                   RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 0.5)
               )
           }
        }
    }
}

struct nospaceTags: View {
    
    var tags: Array<String>
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text("\(tag)")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.vertical, 2)
                    .foregroundColor(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
