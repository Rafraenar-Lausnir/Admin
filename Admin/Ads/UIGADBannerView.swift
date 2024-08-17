//
//  GADBannerView.swift
//  Admin
//
//  Created by Elín Ósk on 17.8.2024.
//

import Foundation
import GoogleMobileAds
import UIKit

class UIGADBannerView: UIViewController {
  var bannerView: GADBannerView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let viewWidth = view.frame.inset(by: view.safeAreaInsets).width

    let adaptiveSize = GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(
      viewWidth
    )
    bannerView = GADBannerView(adSize: adaptiveSize)

    addBannerViewToView(bannerView)

    bannerView.adUnitID = "ca-app-pub-3940256099942544/2435281174"
    bannerView.rootViewController = self

    bannerView.load(GADRequest())

    bannerView.delegate = self
  }

  func addBannerViewToView(_ bannerView: GADBannerView) {
    bannerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(bannerView)
    view.addConstraints(
      [NSLayoutConstraint(
        item: bannerView,
        attribute: .bottom,
        relatedBy: .equal,
        toItem: view.safeAreaLayoutGuide,
        attribute: .bottom,
        multiplier: 1,
        constant: 0),
       NSLayoutConstraint(
        item: bannerView,
        attribute: .centerX,
        relatedBy: .equal,
        toItem: view,
        attribute: .centerX,
        multiplier: 1,
        constant: 0)
    ])
  }
}

// MARK: - GADBannerViewDelegate
extension UIGADBannerView: GADBannerViewDelegate {
  func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
    print("bannerViewDidReceiveAd")
    bannerView.alpha = 0
    UIView.animate(withDuration: 1) {
      bannerView.alpha = 1
    }
  }

  func bannerView(
    _ bannerView: GADBannerView,
    didFailToReceiveAdWithError error: any Error
  ) {
    print(
      "bannerview:didFailToReceiveAdWithError: \(error.localizedDescription)"
    )
  }

  func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
    print("bannerViewDidRecordImpression")
  }

  func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
    print("bannerVieWillPresentScreen")
  }

  func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
    print("bannerViewWillDismissScreen")
  }

  func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
    print("bannerViewDidDismissScreen")
  }
}
