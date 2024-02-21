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

struct ContentView: View {
  var body: some View {

      HStack {
          Thumbnail()
          VStack(alignment: .leading, spacing: 20) {

              DescriptionView()
              Text("Whether you're a kitten or an old-timer, get meowing with this purrsonalized mix of music to meow to!")
              HStack(spacing: 10) {
                  MyButton(title: "Play", systemImage: "play.fill")
                  MyButton(title: "Shuffle", systemImage: "shuffle")
              }
          }
      }
  }
}

struct Thumbnail: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)

                .foregroundColor(.orange)
            Image(systemName: "play.fill")
                .resizable()
                .foregroundColor(.white)
                .opacity(0.5)

                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                HStack {
                    Text("Mewo!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Spacer()
                }

                HStack {
                    Text("Mix")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Spacer()
                }

                Spacer()
            }


        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
        .shadow(radius: 10)
    }
}


struct MyButton: View {
    let title: String
    let systemImage: String
    var body: some View {
        HStack {
            Button(
              action: { print("Play") },
              label: {
                  HStack {
                      Spacer()
                      Label(title, systemImage: systemImage)
                      Spacer()
                  }

              }
            )
            .padding(.vertical)
            .foregroundColor(.orange)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Image("meowMix")
      .resizable()
      .frame(maxHeight: 250)
      .previewLayout(.sizeThatFits)
    
    ContentView()
          .frame(maxHeight: 250)

      Thumbnail()
  }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meow! Mix")
                .font(.title)
                .fontWeight(.semibold)
            Text("Apple Music for Luna")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(.accentColor)
            Text("Updated Caturday")
                .font(Font.system(.body).smallCaps())
        }
    }
}
