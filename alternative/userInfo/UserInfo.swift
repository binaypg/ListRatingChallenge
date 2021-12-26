//
//  UserInfo.swift
//  alternative
//
//  Created by Binay Kumar Sharma on 26/12/21.
//

import SwiftUI

struct UserInfo: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var userInfo:UserListArray
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if userInfo.image?.count ?? 0 > 0{
                VStack(alignment: .center, spacing: 16) {
                    ImageLoadingUI(urlImg: userInfo.image?[0] ?? "")
                         
                    
                    HStack(alignment: .center, spacing: 8) {
                        Button {
                            userInfo.feedback = 1
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            
                            SadUI()
                                .frame(width: 44, height: 44)
                        }
                        Button {
                            userInfo.feedback = 2
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            SmileUI()
                                .frame(width: 44, height: 44)
                        }
                    }
                    .padding()
                }
            }else{
             Text("Image Url Not found")
            }
            
            Spacer()
        }
        .navigationTitle(userInfo.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserInfo_Previews: PreviewProvider {
    @State static var userInfoVal:UserListArray   = UserListArray.example
    static var previews: some View {
        UserInfo(userInfo: $userInfoVal)
    }
}

