//
//  DeviceInformationService.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

protocol DeviceInformationServiceProtocol: class {
    var locale: String { get }
}

final class DeviceInformationService: DeviceInformationServiceProtocol {
    
    var locale: String {
        guard let locale = Locale.current.languageCode else { return "en" }
        return locale
    }
    
}
