//
//  CharacterListPresenter.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

class CharacterListPresenter<T: CharacterListView> {
    
    // MARK: Properties
    private let apiService: ApiServiceType
    
    var items: [CharacterList] = []
    
    weak var view: T?
    
    init(view: T, apiService: ApiServiceType = ApiService()) {
        self.apiService = apiService
        self.view = view
    }
    
    // MARK: Functions
    private func onCharacterListLoaded(items: [CharacterList]) {
        for item in items {
            if !self.items.contains(where: { $0.id == item.id }) {
                self.items.append(item)
            }
        }
    }
    
    func getCharacterListViewModel(index: Int) -> CharacterListViewModel {
        let item = items[index]
        return CharacterListViewModel(from: item)
    }
    
    func getCharacterList(row: Int) -> CharacterList {
        return self.items[row]
    }
    
    func getCharacterListCount() -> Int {
        return items.count
    }
    
    // MARK: API Calls
    func loadCharacterList() {
        apiService.createSingleRequest(from: CharacterRequest(apiRepo: .characters)) { result in
            switch result{
            case .success(let items):
                self.onCharacterListLoaded(items: items.data.results)
                self.view?.reloadTable()
            case .failure(let error):
                print(error)
            }
        }
    }
}
