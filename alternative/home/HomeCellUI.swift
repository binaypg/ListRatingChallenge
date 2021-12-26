//
//  HomeCellUI.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI

struct HomeCellUI: View {
    @Binding var userInfo:UserListArray
    var body: some View {
        
        
        VStack(alignment:.leading,spacing:0){
            HStack(alignment: .firstTextBaseline, spacing: 8){
                if userInfo.image?.count ?? 0 > 0{
                    ImageLoadingUI(urlImg: userInfo.image?[0] ?? "").frame(width: 50, height: 50, alignment: .center)
                }
                Text(userInfo.name ?? "")
                    .foregroundColor(Color("textCol"))
                Spacer()
                if userInfo.feedback == 1{
                    SadUI()
                }else if userInfo.feedback == 2{
                    SmileUI()
                }
                
                
            }
            Divider()
        }
        .padding(.leading)
        
    }
}

struct HomeCellUI_Previews: PreviewProvider {
    @State static var userInfoVal:UserListArray   = UserListArray.example
    static var previews: some View {
        HomeCellUI(userInfo: $userInfoVal)
    }
}
