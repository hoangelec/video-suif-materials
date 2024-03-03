/// Copyright (c) 2023 Kodeco LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct MovieList: View {
  @StateObject var movieStore = MovieStore()
  @State private var isAddPresented = false
  @State private var isSettingPresented = false
  //TODO: add a new state property to track whether the look and feel view is shown
  @ObservedObject var userStore = UserStore()
  //TODO: add a new property to reference the LookAndFeelStore

  @ObservedObject var lookAndFeelStore = LookAndFeelStore()

  var body: some View {
    NavigationView {
      List {
        ForEach(movieStore.movies, id: \.title) {
          MovieRow(movie: $0, lookAndFeelInfo: lookAndFeelStore.lookAndFeelInfo)
        }
      }
      .sheet(isPresented: $isAddPresented) {
        AddMovie(movieStore: movieStore, lookAndFeelStore: lookAndFeelStore, showModal: $isAddPresented)
      }
      .sheet(isPresented: $isSettingPresented, content: {
        VStack {
          LookAndFeelView(lookAndFeelInfo: $lookAndFeelStore.lookAndFeelInfo, isPresented: $isSettingPresented)
        }

      })
      //TODO: you'll need to present the LookAndFeelDialogView..
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(
        leading:
          NavigationLink(destination: UserView(userStore: userStore)) {
            HStack {
              Text(userStore.currentUserInfo.userName)
              Image(systemName: "person.fill")
            }
          },
        trailing:
        HStack {
          Button(action: { isSettingPresented.toggle() }) {
            Image(systemName: "gear")
          }
          Button(action: { isAddPresented.toggle() }) {
            Image(systemName: "plus")
          }
        }
      )
    }
    .tint(lookAndFeelStore.lookAndFeelInfo.accentColor)
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList(movieStore: MovieStore())
  }
}
