//
//  ViewController3.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

class ViewController3: UIViewController {
    
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileManager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func selectChooseImageBackgroung () {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        

    }
    
    @IBAction func backgroundStyle (_ sender: UIButton){
        selectChooseImageBackgroung()
    }

    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pageStyleAction (_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "StyleCheckers", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
}

extension ViewController3: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        guard let image = info[.originalImage] as? UIImage else {return}
        let data = image.pngData()
           
           let fileURL = documentDirectory.appendingPathComponent("imageView")
               try? data?.write(to: fileURL)
        print("choose")
        
    

        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("exit")
        picker.dismiss(animated: true, completion: nil)
    }
}
