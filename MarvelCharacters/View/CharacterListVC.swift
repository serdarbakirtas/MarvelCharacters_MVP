//
//  CharacterListVC.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

import UIKit

protocol CharacterListView: class {
    func reloadTable()
}

class CharacterListVC: UIViewController {
    
    private let CELL_HEIGHT: CGFloat = 40.0
    
    // MARK: UI
    lazy var tableUserList: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .white
        tb.separatorStyle = .none
        tb.register(CharacterListCell.self, forCellReuseIdentifier: "CharacterListCell")
        return tb
    }()
    
    private var presenter: CharacterListPresenter<CharacterListVC>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CharacterListPresenter(view: self)
        presenter.loadCharacterList()
        
        addSubviews()
        tableUserList.dataSource = self
        tableUserList.delegate = self
    }
    
    // MARK: Subviews
    private func addSubviews() {
        view.addSubview(tableUserList)
        
        NSLayoutConstraint.activate([
            tableUserList.topAnchor.constraint(equalTo: view.topAnchor),
            tableUserList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableUserList.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableUserList.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}

// MARK: View
extension CharacterListVC: CharacterListView {
    
    func reloadTable() {
        tableUserList.reloadData()
    }
}

// MARK: Tableview Delegate and DataSource
extension CharacterListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
}

extension CharacterListVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCharacterListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCell", for: indexPath) as! CharacterListCell
        let characterListViewModel = presenter.getCharacterListViewModel(index: indexPath.row)
        cell.populateCell(with: characterListViewModel)
        return cell
    }
}
