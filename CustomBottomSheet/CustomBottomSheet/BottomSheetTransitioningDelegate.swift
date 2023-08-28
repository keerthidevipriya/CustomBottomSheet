//
//  BottomSheetTransitioningDelegate.swift
//  CustomBottomSheet
//
//  Created by Keerthi Devipriya(kdp) on 28/08/23.
//

import UIKit

final class BottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    private weak var bottomSheetPresentationController: BottomSheetPresentationController?

       var preferredSheetTopInset: CGFloat
       var preferredSheetCornerRadius: CGFloat
       var preferredSheetSizingFactor: CGFloat
       var preferredSheetBackdropColor: UIColor

       var tapToDismissEnabled: Bool = true {
           didSet {
               bottomSheetPresentationController?.tapGestureRecognizer.isEnabled = tapToDismissEnabled
           }
       }

       var panToDismissEnabled: Bool = true {
           didSet {
               bottomSheetPresentationController?.panToDismissEnabled = panToDismissEnabled
           }
       }

       init(
           preferredSheetTopInset: CGFloat,
           preferredSheetCornerRadius: CGFloat,
           preferredSheetSizingFactor: CGFloat,
           preferredSheetBackdropColor: UIColor
       ) {
           self.preferredSheetTopInset = preferredSheetTopInset
           self.preferredSheetCornerRadius = preferredSheetCornerRadius
           self.preferredSheetSizingFactor = preferredSheetSizingFactor
           self.preferredSheetBackdropColor = preferredSheetBackdropColor
           super.init()
       }

       func presentationController(
           forPresented presented: UIViewController,
           presenting: UIViewController?,
           source: UIViewController
       ) -> UIPresentationController? {
           let bottomSheetPresentationController = BottomSheetPresentationController(
               presentedViewController: presented,
               presenting: presenting ?? source,
               sheetTopInset: preferredSheetTopInset,
               sheetCornerRadius: preferredSheetCornerRadius,
               sheetSizingFactor: preferredSheetSizingFactor,
               sheetBackdropColor: preferredSheetBackdropColor
           )

           bottomSheetPresentationController.tapGestureRecognizer.isEnabled = tapToDismissEnabled
           bottomSheetPresentationController.panToDismissEnabled = panToDismissEnabled

           self.bottomSheetPresentationController = bottomSheetPresentationController

           return bottomSheetPresentationController
       }

       func animationController(
           forDismissed dismissed: UIViewController
       ) -> UIViewControllerAnimatedTransitioning? {
           guard
               let bottomSheetPresentationController = dismissed.presentationController as? BottomSheetPresentationController,
               bottomSheetPresentationController.bottomSheetInteractiveDismissalTransition.interactiveDismissal
           else {
               return nil
           }

           return bottomSheetPresentationController.bottomSheetInteractiveDismissalTransition
       }

       func interactionControllerForDismissal(
           using animator: UIViewControllerAnimatedTransitioning
       ) -> UIViewControllerInteractiveTransitioning? {
           animator as? BottomSheetInteractiveDismissalTransition
       }
}
