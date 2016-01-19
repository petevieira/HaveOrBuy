//
//  HBMainViewController.swift
//  have or buy
//
//  Created by Peter Vieira on 1/18/16.
//  Copyright © 2016 rapierevite. All rights reserved.
//

import UIKit

class HBMainViewController: UIViewController {

    weak var leftViewController: UIViewController!

    weak var rightViewController: UIViewController!

    var currentViewControllerIsLeft: Bool = false

    /**
     * \brief Gets executed when the main view controller loads.
     * Creates the On-hand and Shopping list view controllers and
     * moves the Shopping list view to the right of the screen
     */
    override func viewDidLoad() {
        super.viewDidLoad()

        // create left On-Hand list view and
        // right Shopping list view and start with the right
        // list with its coordinates shifted to the right by the
        // width of the main view
        leftViewController = instantiateViewController()
        rightViewController = instantiateViewController()
        rightViewController.view.backgroundColor = UIColor.blueColor()
        rightViewController.view.frame.offsetInPlace(dx: view.bounds.width, dy: 0)
        currentViewControllerIsLeft = true
    }

    /**
     * \brief Creates a UIViewController and adds it as a subview
     * to the main view controller with the same bounds
     */
    func instantiateViewController() -> UIViewController {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("list")
        addChildViewController(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        return vc
    }

    /**
     * \brief Gets called by the Pan Gesture Recognizer in the UI
     */
    @IBAction
    func panRecognized(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Began:
            break
        case .Changed:
            // pan both list views in pan gesture direction
            panViews(sender.translationInView(self.view).x)
        case .Ended:
            // change to view more on the screen
            UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
                let tx = sender.translationInView(self.view).x
                if((self.currentViewControllerIsLeft && tx < 0 || !self.currentViewControllerIsLeft && tx > 0)
                    && fabs(tx) > (self.view.frame.width / 5)) {
                    self.switchView()
                } else {
                    self.restoreView()
                }
                }, completion: { (finished) -> Void in
            })
        default:
            // pan both list views in pan gesture direction
            panViews(sender.translationInView(self.view).x)
            break;
        }
    }

    /**
     * \brief Translate both views by tx
     * \param tx Pan gesture distance in x direction. Right is positive.
     */
    func panViews(tx: CGFloat) {
        if((currentViewControllerIsLeft && tx < 0) || !currentViewControllerIsLeft && tx > 0) {
            leftViewController.view.transform = CGAffineTransformMakeTranslation(tx, 0)
            rightViewController.view.transform = CGAffineTransformMakeTranslation(tx, 0)
        }
    }

    /**
     * \brief Restores to the view originally on the screen
     */
    func restoreView() {
        leftViewController.view.transform = CGAffineTransformIdentity
        rightViewController.view.transform = CGAffineTransformIdentity
    }

    /**
     * \brief Switches the view to the off-screen list
     */
    func switchView() {
        leftViewController.view.transform = CGAffineTransformIdentity
        rightViewController.view.transform = CGAffineTransformIdentity
        if(currentViewControllerIsLeft) {
            leftViewController.view.frame.origin = CGPoint(x: -view.frame.width, y: 0)
            rightViewController.view.frame.origin = CGPoint(x: 0, y: 0)
        } else {
            leftViewController.view.frame.origin = CGPoint(x: 0, y: 0)
            rightViewController.view.frame.origin = CGPoint(x: view.frame.width, y: 0)
        }
        currentViewControllerIsLeft = !currentViewControllerIsLeft
    }
}
