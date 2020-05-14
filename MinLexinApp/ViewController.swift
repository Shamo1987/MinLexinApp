//
//  ViewController.swift
//  MinLexinApp
//
//  Created by Shamo Zahidov on 2020-05-07.
//  Copyright © 2020 Shamo Zahidov. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var searchBarn: UISearchBar!
    @IBOutlet weak var ordTableView: UITableView!
    
    var ordList = [Ord]()
    
    var ref:DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ordTableView.delegate = self
        ordTableView.dataSource = self
        
        searchBarn.delegate = self
        
        
        ref = Database.database().reference()
       getAllaOrd()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indeks = sender as? Int
        let togoVC = segue.destination as! OrdDetaljViewController
        
        togoVC.minord = ordList[indeks!]
    }
   
    func getAllaOrd(){
        ref.child("ord").observe(.value, with: {snapshot in
            
            if let inkommandeData = snapshot.value as?[String:AnyObject]{
                self.ordList.removeAll()
                
                for inkommandeLineData in inkommandeData{
                    
                    if let lexin = inkommandeLineData.value as? NSDictionary{
                       
                        let key = inkommandeLineData.key
                        let svenska = lexin["svenska"] as? String ?? ""
                        let engelska = lexin["engelska"] as? String ?? ""
                        
                        let fleraord = Ord(ord_id: key, engelska: engelska, svenska: svenska)
                        
                        self.ordList.append(fleraord)
                    }
                    
                }
               
                DispatchQueue.main.async {
                    self.ordTableView.reloadData()
                }
                
                
                
            }
            
        })
        
    }

    func makeSearch(sokOrd:String){
        
        ref.child("ord").observe(.value, with: {snapshot in
            
            if let inkommandeData = snapshot.value as?[String:AnyObject]{
                self.ordList.removeAll()
                
                for inkommandeLineData in inkommandeData{
                    
                    if let lexin = inkommandeLineData.value as? NSDictionary{
                       
                        let key = inkommandeLineData.key
                        let svenska = lexin["svenska"] as? String ?? ""
                        let engelska = lexin["engelska"] as? String ?? ""
                        
                        if engelska.contains(sokOrd){
                            let fleraord = Ord(ord_id: key, engelska: engelska, svenska: svenska)
                                                   
                            self.ordList.append(fleraord)
                            
                        }
                        
                    }
                    
                }
               
                DispatchQueue.main.async {
                    self.ordTableView.reloadData()
                }
                
                
                
            }
            
        })
        
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return ordList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ord = ordList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordCell", for: indexPath) as! OrdCellTableViewCell
        
        
        cell.engelskaLabel.text = ord.engelska
        cell.svenskaLabel.text = ord.svenska
        
        return cell
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toOrdDetail", sender: indexPath.row)
    }
    
    
}



extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Sök Resultat : \(searchText)")
        
        if searchText == "" {
            getAllaOrd()
            
        }else{
            
            makeSearch(sokOrd: searchText)
        }
        
        
        
    }
}
