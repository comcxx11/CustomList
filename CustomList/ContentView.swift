//
//  ContentView.swift
//  CustomList
//
//  Created by SEOJIN HONG on 2022/04/08.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
