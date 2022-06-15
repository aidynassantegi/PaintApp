//
//  ViewController.swift
//  Paint App
//
//  Created by Aidyn Assan on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fillSwitch: UISwitch!
    
    @IBOutlet weak var circleButtonOutlet: UIButton!
    @IBOutlet weak var rectangleButtonOutlet: UIButton!
    @IBOutlet weak var lineButtonOutlet: UIButton!
    @IBOutlet weak var triangleButtonOutlet: UIButton!
    @IBOutlet weak var penButtonOutlet: UIButton!
    @IBOutlet weak var undoButtonOutlet: UIButton!
    
    
    
    let colors = [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)]
    let canvas: Canvas = {
        let canvas = Canvas()
        canvas.backgroundColor = .white
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()
    
    var buttonFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(canvas)
        NSLayoutConstraint.activate([
            canvas.topAnchor.constraint(equalTo: undoButtonOutlet.bottomAnchor, constant: 10),
            canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    @IBAction func circleButton(_ sender: UIButton) {
        canvas.shapeType = .circle
    }
    @IBAction func rectangleButton(_ sender: UIButton) {
        canvas.shapeType = .rectangle
    }
    @IBAction func lineButton(_ sender: UIButton) {
        canvas.shapeType = .line
    }
    @IBAction func triangleButton(_ sender: UIButton) {
        canvas.shapeType = .triangle
    }
    @IBAction func penButton(_ sender: UIButton) {
        canvas.shapeType = .pencil
    }
    @IBAction func undoButton(_ sender: UIButton) {
        canvas.undo()
    }
    @IBAction func filledOrNot(_ sender: UISwitch) {
        if sender.isOn {
            canvas.isFilled = true
        }else {
            canvas.isFilled = false
        }
    }
    
    

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        canvas.objectColor = colors[indexPath.row]
    }
    
}


