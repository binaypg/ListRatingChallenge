//
//  smileUI.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI

struct SmileUI: View {
    var body: some View {
        Image("likeO96")
            .resizable()
            .frame(width: 40, height: 40, alignment: .center)
    }
}

struct SmileUI_Previews: PreviewProvider {
    static var previews: some View {
        SmileUI()
    }
}
