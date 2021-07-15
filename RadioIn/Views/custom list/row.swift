//
//  row.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/14/21.
//

import SwiftUI

struct row: View {
       let text : String
       let index : Int
       let width : CGFloat = 60
       @Binding var indices : [Int]
       @State var offset = CGSize.zero
       @State var scale : CGFloat = 0.5
    
    
    var body: some View {
        GeometryReader { geo in
            HStack (spacing : 0){
                        
              Text(text)
                .padding()
                .frame(width : geo.size.width, alignment: .leading)
                        
              ZStack {
                Image(systemName: "trash")
                  .font(.system(size: 20))
                  .scaleEffect(scale)
               }
                .frame(width: width, height: geo.size.height)
              .background(Color.red.opacity(0.8))
                .onTapGesture {
                    indices.append(index)
                 }
             }
              .background(Color.secondary.opacity(0.1))
            .offset(self.offset)
            .animation(.spring())
            .gesture(DragGesture()
                  .onChanged { gesture in
                               self.offset.width = gesture.translation.width
                              }
                  .onEnded { _ in
                             if self.offset.width < -50 {
                                    self.scale = 1
                                    self.offset.width = -60
                              } else {
                                    self.scale = 0.5
                                    self.offset = .zero
                             }
                           }
                    )
          }
    }
}

struct row_Previews: PreviewProvider {
    static var previews: some View {
        row(text: "lius", index: 2, indices: .constant([1]))
            .previewLayout(.sizeThatFits)
    }
}
