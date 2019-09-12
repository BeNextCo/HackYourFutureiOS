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

class EventListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: EventListViewModelProtocol!
    var coordinator: EventListCoordinatorProtocol!

    private var cellViewModels = [EventListCellViewModelProtocol]()

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        observeViewModel()
    }

    private func observeViewModel() {
        viewModel.cellViewModels
            .subscribe(onNext: { [weak self] cellViewModels in
                self?.cellViewModels = cellViewModels
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}
