//
//  StudentsViewController.swift
//  lesson16 homeWork
//
//  Created by Женя  on 8.08.21.
//

import UIKit

enum Mark: Int {
    
    case MarkTwo = 0
    case MarkThree = 1
    case MarkFour = 2
    case MarkFive  = 3
}
class StudentViewController: UIViewController {
     @IBOutlet weak var tableViewStudent: UITableView!
     
    var students : [Students] = []
    
       override func viewDidLoad() {
       super.viewDidLoad()
        let studentsName = ["Valera", "Nastya", "Kostya", "Leha", "Dima", "Anya", "Igor", "Egor", "Jenya", "Lena", "Masha", "Yana", "Sergey", "Anjela", "Natasha", "Polina", "Maksim","Vanya","Lera","Nadya",]
    
    
        for value in studentsName {
            let mark = Float.random(in: 2...5)
            students.append(Students(name: value , averageMark: mark))
        }
    
        students = students.sorted(by: { $0.name < $1.name})
       
        tableViewStudent.dataSource = self
        tableViewStudent.delegate = self
         
        tableViewStudent.register(UINib(nibName: "StudentsTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentsTableViewCell")
        
    
    
   }
}


extension StudentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         guard let section = Mark(rawValue: section) else {return 0}
         
         switch section {
             case .MarkFive: return students.filter {$0.averageMark > 4.5}.count
             case .MarkFour: return students.filter {$0.averageMark > 4 && $0.averageMark < 4.5}.count
             case .MarkThree: return students.filter {$0.averageMark > 3 && $0.averageMark < 4}.count
             case .MarkTwo:  return students.filter {$0.averageMark < 3 }.count
         }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         guard let section = Mark(rawValue: section) else {return ""}
         
         switch section {
             case .MarkFive: return "Отличник"
             case .MarkFour: return "Хорошист"
             case .MarkThree: return "Троечник"
             case .MarkTwo:  return "Двоечник"
         }
         
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         guard let cell = tableViewStudent.dequeueReusableCell(withIdentifier: "StudentsTableViewCell") as? StudentsTableViewCell,
               let section = Mark(rawValue: indexPath.section) else { return UITableViewCell() }
         
         switch section {
             case .MarkFive: cell.printStudent(value: students.filter{$0.averageMark > 4.5}[indexPath.row])
             case .MarkFour: cell.printStudent(value: students.filter{$0.averageMark > 4 && $0.averageMark < 4.5 }[indexPath.row])
             case .MarkThree: cell.printStudent(value: students.filter{$0.averageMark > 3 && $0.averageMark < 4 }[indexPath.row])
             case .MarkTwo:  cell.printStudent(value: students.filter{$0.averageMark < 3}[indexPath.row])
         }
         
         cell.contentView.backgroundColor = (Float(cell.labelAverage.text ?? "0") ?? 0) <= 2.5 ? .red : .cyan
         return cell
   }
}


extension StudentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 50
    }
}
