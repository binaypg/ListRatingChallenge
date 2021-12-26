//
//  LoaderUI.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI

struct LoaderUI: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle()).scaleEffect(1)
    }
}

struct LoaderUI_Previews: PreviewProvider {
    static var previews: some View {
        LoaderUI()
    }
}
