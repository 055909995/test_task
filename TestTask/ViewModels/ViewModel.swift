//
//  ViewModel.swift
//  TestTask
//
//  Created by Vardan Sargsyan on 14.03.22.
//

import Foundation


class ViewModel {
    
    public var sections = [Section]()
    
    
    func getItems (complition: @escaping (_ hasResult: Bool?) -> Void){
        NetworkClient.shared.getSections(complition: { result in
            guard result != nil else {
                return
            }
            self.sections = result!
            complition(true)
        })
    }
    
}
