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
import Combine

struct UserView: View {
  @State private var userName = ""
  @State private var favoriteGenre = Genre.action
  @ObservedObject var userStore: UserStore

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("User")) {
          TextField("User Name", text: $userName)
        }
        Section(header: Text("Favorite Genre")) {
          GenrePicker(genre: $favoriteGenre)
        }
      }
    }
    .navigationBarTitle(Text("\(userName) Info"), displayMode: .inline)
    .navigationBarItems(
      trailing:
        Button(action: { updateUserInfo() }) {
          Text("Update")
        }
    )
    .onAppear {
      userName = userStore.currentUserInfo.userName
      favoriteGenre = userStore.currentUserInfo.favoriteGenre
    }
  }

  func updateUserInfo() {
    let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView(userStore: UserStore())
  }
}
