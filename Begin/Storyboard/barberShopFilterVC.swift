//
//  barberShopFilterVC.swift
//  Begin
//
//  Created by Siddhesh jadhav on 30/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import SwiftUI

class barberShopFilterVC: UIViewController {
    
    @IBOutlet var servicesBtn: [UIButton]!
    @IBOutlet var starBtn: [UIButton]!
    @IBOutlet weak var starLbl: UILabel!
    @IBOutlet var priceBtn: [UIButton]!
    @IBOutlet var genderBtn: [UIButton]!
    @IBOutlet var genderLbl: [UILabel]!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var showDistanceLbl: UILabel!
    @IBOutlet weak var applyFilterBtn: UIButton!
    
    @IBOutlet weak var customSliderView: UIView!
    
    let rangeSlider = RangeSlider(frame: CGRect())
    
    var selectedService: String?
    var selectedRating: String?
    var selectedGender: String?
    var selectedDistance: String?
    var selectedSortPattern: String?
    var selectedPriceRange: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        starLbl.text = "0.0 Star"
        showDistanceLbl.text = " \(String(Int(rangeSlider.upperValue))).0 km"
        
        applyFilterBtn.roundButton()
        
        applyFilterBtn.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        
        customSliderView.addSubview(rangeSlider)
        
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(rangeSlider:)), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 0.0
        let width = customSliderView.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin , width: width, height: 25.0)
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        showDistanceLbl.text = " \(String(Int(rangeSlider.upperValue))).0 km"
        selectedDistance = " \(String(Int(rangeSlider.upperValue))).0 km"
    }
    
    
    
    @IBAction func servicesBtnTapped(_ sender: UIButton) {
        for  button in servicesBtn {
            if button.tag == sender.tag {
                button.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
                button.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
                print("\(button.currentTitle!) : tag \(sender.tag)")
                selectedService = button.currentTitle
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
                button.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            }
        }
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("rated \(sender.tag)")
        for  button in starBtn {
            if button.tag <= sender.tag {
                button.tintColor = #colorLiteral(red: 0.9960784314, green: 0.5882352941, blue: 0.3294117647, alpha: 1)
                starLbl.text = "\(sender.tag).0 Star"
                selectedRating = "\(sender.tag).0 Star"
            } else {
                button.tintColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            }
        }
    }
    
    @IBAction func genderSelected(_ sender: UIButton) {
        
        for button in genderBtn{
            if button.tag == sender.tag{
                button.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
                button.setImage(#imageLiteral(resourceName: "icons8-filled-circle-32"), for: .normal)
                button.tintColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
                if sender.tag == 1{
                    print("selected Men")
                    selectedGender = "Men"
                }
                else if sender.tag == 2{
                    print("selected Women")
                    selectedGender = "Women"
                }
                else if sender.tag == 3{
                    print("selected Other")
                    selectedGender = "Other"
                }
            }
            else{
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
                button.setImage(nil, for: .normal)
            }
        }
    }
    
    
    @IBAction func priceBtnTapped(_ sender: UIButton) {
        for  button in priceBtn {
            if button.tag == sender.tag {
                button.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
                button.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
                print("\(button.currentTitle!) : tag \(sender.tag)")
                selectedPriceRange = button.currentTitle
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
                button.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            }
        }
    }
    
    
    @IBAction func applyFilterBtnTapped(_ sender: UIButton) {
        print("================================")
        print("Filter Applyed")
        
        print(" \(selectedService ?? "nil") \n \(selectedRating ?? "nil") \n \(selectedGender ?? "nil") \n \(selectedDistance ?? "nil") \n \(selectedSortPattern ?? "nil") \n \(selectedPriceRange ?? "nil")")
        
        //performSegue(withIdentifier: "unwindToHomeVC", sender: self)
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?){
        }
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Reset(_ sender: UIBarButtonItem) {
        print("Resetted")
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
            let cell = tableView.cellForRow(at: selectedIndexPath) as! sortCell
            cell.listLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            cell.accessoryType = .none
        }
        
        for  button in servicesBtn {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
            button.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        }
        
        for  button in starBtn {
            button.tintColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        }
        
        for button in genderBtn{
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            button.setImage(nil, for: .normal)
        }
        
        for  button in priceBtn {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
            button.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        }
        
        rangeSlider.upperValue = 5.0
        
        starLbl.text = "0.0 Star"
        showDistanceLbl.text = " \(String(Int(rangeSlider.upperValue))).0 km"
        
        selectedService = "nil"
        selectedRating = "nil"
        selectedGender = "nil"
        selectedDistance = "nil"
        selectedSortPattern = "nil"
        selectedPriceRange = "nil"
    }
}

extension barberShopFilterVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortByList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sortByCell", for: indexPath) as! sortCell
        cell.setList(listItem: sortByList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Selected:- \(sortByList[indexPath.row].sortList)")
        
        selectedSortPattern = sortByList[indexPath.row].sortList
        
        let cell = tableView.cellForRow(at: indexPath) as! sortCell
        cell.listLbl.textColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
        cell.accessoryType = .checkmark
        cell.tintColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("DeSelected:- \(sortByList[indexPath.row].sortList)")
        
        let cell = tableView.cellForRow(at: indexPath) as! sortCell
        cell.listLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        cell.accessoryType = .none
    }
}
