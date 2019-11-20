//
//  EventListViewController.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class EventListViewController: UIViewController {
    
    @IBOutlet private(set) weak var tableView: UITableView!
    
    var viewModel: EventListViewModelProtocol!
    var coordinator: EventListCoordinatorProtocol!

    private var cellViewModels = [EventListCellViewModelProtocol]()

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerCells()

        observeViewModel()

        viewModel.fetchEvents()
    }

    private func observeViewModel() {
        viewModel
            .cellViewModels
            .bind(to: tableView.rx.items(cellIdentifier: "cell",
                                         cellType: EventListCell.self)) { _, element, cell in
                                            cell.viewModel = element
            }
            .disposed(by: disposeBag)
    }

    private func registerCells() {
        self.tableView.register(UINib(nibName: "EventListCell", bundle: nil),
                                forCellReuseIdentifier: "cell")
    }
}
