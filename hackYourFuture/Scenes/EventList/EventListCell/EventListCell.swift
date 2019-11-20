//
//  EventListCell.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import UIKit

class EventListCell: UITableViewCell {

    @IBOutlet private(set) weak var eventTypeImageView: UIImageView!
    @IBOutlet private(set) weak var eventTypeLabel: UILabel!
    @IBOutlet private(set) weak var eventInformationDate: UILabel!
    @IBOutlet private(set) weak var attendeesImageView: UIImageView!
    @IBOutlet private(set) weak var attendeesNumberLabel: UILabel!

    var viewModel: EventListCellViewModelProtocol! {
        didSet {
            self.configure()
        }
    }

    private func configure() {
        self.eventTypeLabel.text = viewModel.title
        self.eventInformationDate.text = viewModel.date
        self.attendeesNumberLabel.text = "0"
    }
}
