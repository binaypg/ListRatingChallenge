//
//  ImageLoadingUI.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI

struct ImageLoadingUI: View {
    @StateObject var vm:ImageLoadingUIViewModel
    
    init( urlImg:String){
        _vm = StateObject(wrappedValue: ImageLoadingUIViewModel(imgUrl: urlImg))
        
    }
    
    var body: some View {
        if let image = vm.image{
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        }else if vm.isLoading {
            LoaderUI()
        }else{
            Image(systemName: "questionmark")
                //.foregroundColor(Color.theme.secondaryText)
        }
    }
}
struct ImageLoadingUI_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingUI(urlImg: "https://d93golxnkabrk.cloudfront.net/things/bb7b0331-a904-11e1-9412-005056900141.jpg?w=200")
    }
}
