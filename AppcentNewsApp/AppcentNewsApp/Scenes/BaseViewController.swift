//
//  BaseViewController.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    func share(title: String, sourceUrl: String) {
        let objectsToShare: URL = URL(string: sourceUrl)!
        let sharedObjects: [AnyObject] = [objectsToShare as AnyObject, title as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ .airDrop, .message, .postToFacebook, .message, .postToTwitter, .addToReadingList, .copyToPasteboard]
        present(activityViewController, animated: true, completion: nil)
    }
}
