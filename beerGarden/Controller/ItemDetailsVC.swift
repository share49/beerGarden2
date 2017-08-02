//
//  ItemDetailsVC.swift
//  beerGarden
//
//  Created by Roger Pintó Diaz on 8/2/17.
//  Copyright © 2017 Roger Pintó Diaz. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var stylePicker: UIPickerView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var alcoholField: UITextField!
    @IBOutlet weak var thumbImg: UIImageView!
    
    var tiposArray = [Tipo]()
    var itemToEdit: Objeto?
    var imagePicker: UIImagePickerController!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        stylePicker.delegate = self
        stylePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
//        let tipo = Tipo(context: context)
//        tipo.type = "Bock"
//        let tipo2 = Tipo(context: context)
//        tipo2.type = "Pilsner"
//        let tipo3 = Tipo(context: context)
//        tipo3.type = "Lager"
//        let tipo4 = Tipo(context: context)
//        tipo4.type = "Brown Ale"
//        let tipo5 = Tipo(context: context)
//        tipo5.type = "IPA"
//        let tipo6 = Tipo(context: context)
//        tipo6.type = "Pale Ale"
//        let tipo7 = Tipo(context: context)
//        tipo7.type = "Porter"
//        let tipo8 = Tipo(context: context)
//        tipo8.type = "Stout"
//        let tipo9 = Tipo(context: context)
//        tipo9.type = "Märzenbier"
//
//        ad.saveContext()
        getTipos()
        
        if itemToEdit != nil {
            
            loadItemData()
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let tipo = tiposArray[row]
        return tipo.type
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return tiposArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //Update when selected
    }
    
    func getTipos() {
        
        let fetchRequest: NSFetchRequest<Tipo> = Tipo.fetchRequest()
        
        do {
            
            self.tiposArray = try context.fetch(fetchRequest)
            self.stylePicker.reloadAllComponents()
            
        } catch {
            
            //Handle the error
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Objeto!
        let picture = Imagen(context: context)
        picture.image = thumbImg.image
        
        if itemToEdit == nil {
            
            item = Objeto(context: context)
        } else {
            
            item = itemToEdit
        }
        
        
        item.toImagen = picture
        
        
        if let title = titleField.text {
            
            item.title = title
        }
        
        if let price = priceField.text {
            
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            
            item.details = details
        }
        
        if let alcohol = alcoholField.text {
            
            item.alcohol = (alcohol as NSString).doubleValue
        }
        
        item.toTipo = tiposArray[stylePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            alcoholField.text = "\(item.alcohol)"
            
            thumbImg.image = item.toImagen?.image as? UIImage
            
            if let tipo = item.toTipo {
                
                var index = 0
                repeat {
                    
                    let t = tiposArray[index]
                    if t.type == tipo.type {
                        
                        stylePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                    
                } while (index < tiposArray.count)
            }
        }
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil {
            
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thumbImg.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
