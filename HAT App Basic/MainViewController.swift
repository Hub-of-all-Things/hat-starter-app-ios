/**
* Copyright (C) 2019 Dataswift Ltd
*
* SPDX-License-Identifier: MPL2
*
* This file is part of the Hub of All Things project (HAT).
*
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, You can obtain one at http://mozilla.org/MPL/2.0/
*/

import HAT_API_for_iOS
import SwiftyJSON

// MARK: Class

class MainViewController: HATUIViewController, Storyboarded, UITableViewDataSource {
    
    // MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var hatTextField: UITextField!

    // MARK: - Variables
    
    var coordinator: MainViewCoordinator?
    private var testModelsReceived: [TestModel] = []
    
    // MARK: - IBActions
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        let model = TestModel(text: self.hatTextField.text ?? "")
        let encodedData = TestModel.encode(from: model)
        guard encodedData != nil else { return }
        
        HATAccountService.createTableValue(
            userToken: userToken,
            userDomain: userDomain,
            namespace: AppStatusManager.getAppName(),
            scope: "testing",
            parameters: encodedData! as Dictionary<String, Any>,
            successCallback: testDataCreated,
            errorCallback: failReceivingData)
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        KeychainManager.clearKeychainKey(key: KeychainConstants.logedIn)
        KeychainManager.clearKeychainKey(key: KeychainConstants.userToken)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.coordinator?.logOutUser()
    }
    
    // MARK: - View Controller Delegate
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.loadData()
    }
    
    private func loadData() {
    
        HATAccountService.getHatTableValues(
            token: userToken,
            userDomain: userDomain,
            namespace: AppStatusManager.getAppName(),
            scope: "testing",
            parameters:["sortBy": "createdDate", "ordering": "descending"],
            successCallback: testDataReceived,
            errorCallback: failReceivingData)
    }
    
    private func testDataReceived(data: [JSON], userToken: String?) {
        
        testModelsReceived.removeAll()
        for item in data {
            
            let model: TestModel? = TestModel.decode(from: item["data"].dictionaryValue)
            guard model != nil else { continue }

            testModelsReceived.append(model!)
        }
        
        self.tableView.reloadData()
    }
    
    private func testDataCreated(data: JSON, userToken: String?) {
        
        let model: TestModel? = TestModel.decode(from: data["data"].dictionaryValue)
        guard model != nil else { return }

        testModelsReceived.insert(model!, at: 0)
        self.tableView.reloadData()
    }
    
    private func failReceivingData(error: HATTableError) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return testModelsReceived.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = self.testModelsReceived[indexPath.row].text
        return cell
    }
}

struct TestModel: HATObject {
    
    var text: String = ""
    var dateCreated: String = ""
    
    init(text: String) {
        
        self.dateCreated = HATFormatterHelper.formatDateToISO(date: Date())
        self.text = text
    }
}
