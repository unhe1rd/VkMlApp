//
//  FaqView.swift
//  Artify
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation
import SwiftUI

struct FaqView: View {
    let magicImage = ImageConstants.magicImageName
    let photoImage = ImageConstants.photosImageName
    let cameraImage = ImageConstants.cameraImageName
    let shareImage = ImageConstants.shareImageName
    var body: some View {
        VStack(alignment: .center, spacing: 32){
            VStack(alignment:.leading, spacing: 24){
                Text("FAQ")
                    .font(.custom("AmericanTypewriter", size: 24))
                Text("Artify - мобильное приложение для создания аниме версии вашей фотографии!")
                    .font(.custom("AmericanTypewriter", size: 24))
                ImageView(imageName: magicImage, text: "- Создать аниме версию фото")
                ImageView(imageName: photoImage, text: "- Выбрать фото из галереи")
                ImageView(imageName: cameraImage, text: "- Сделать фото")
                ImageView(imageName: shareImage, text: "-  Поделиться фото")
            }
            .padding(.top, 64)
            .padding(16)
        }
        Spacer()
    }
}

struct ImageView: View {
    //View Properties
    var imageName:String
    var text:String
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .resizable()
                .frame(width: 48, height: 48)
            Text(text)
                .font(.custom("AmericanTypewriter", size: 16))
        }
        .padding(.top, 16)
    }
}


#Preview {
    FaqView()
}
