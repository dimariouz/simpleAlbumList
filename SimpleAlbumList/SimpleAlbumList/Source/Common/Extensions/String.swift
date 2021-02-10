//
//  String.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

extension String {
    var localized: String {
        return Bundle.localizedBundle.localizedString(forKey: self, value: nil, table: nil)
    }
}

extension Bundle {
    
    public static var localizedBundle: Bundle {
        let code: DeviceInformationServiceProtocol = DeviceInformationService()
        guard let path = Bundle.main.path(forResource: code.locale, ofType: "lproj"),
            let bundle = Bundle(path: path) else {
                return Bundle.main
        }
        return bundle
    }
}
