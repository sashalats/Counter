//
//  ViewController.swift
//  Counter
//
//  Created by sashalats on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var buttonPlusCounter: UIButton!
    @IBOutlet weak var buttonMinusCounter: UIButton!
    @IBOutlet weak var textViewHistory: UITextView!
    
    
    //Данные счетчика
    private var counterValue: Int = 0
    
    //Дата
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss" // Specify the format you want
        return formatter
    }()
    
    // Прокрутка textView до последней строки
    private func scrollToBottom() {
      
        // Диапазон для последней строки
        let range = NSMakeRange(textViewHistory.text.count - 1, 1)
        textViewHistory.scrollRangeToVisible(range)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Значение счетчика
        labelCounter.text = "0"
        
        //Дискриптор счетчик
        labelText.text = "значение счётчика"
        
        //Дескриптор истории изменений
        textViewHistory.text = ""
        textViewHistory.textColor = UIColor.black
        
        //Выключение редактирования и включение скролла
        textViewHistory.isEditable = false
        textViewHistory.isScrollEnabled = true
        
        //Конфигурация кнопки "+"
        //buttonPlusCounter.titleLabel?.text = "+"
        buttonPlusCounter.backgroundColor = UIColor (red: 0.141, green: 0.286, blue: 1, alpha: 1)
        buttonPlusCounter.layer.cornerRadius = 20
        
        //Конфигурация кнопки "-"
        //buttonMinusCounter.titleLabel?.text = "-"
        buttonMinusCounter.backgroundColor = UIColor (red: 0.988, green: 0.114, blue: 0.464, alpha: 1)
        buttonMinusCounter.layer.cornerRadius = 20
    }
    
    
    
    //функция кнопки "+"
    @IBAction func buttonPlusTap(_ sender: Any) {
        print ("Книга добавлена")
        
        counterValue += 1
        labelCounter.text = String(counterValue)
        
        //История измененний
        let currentDataTime = dateFormatter.string(from: Date())
        textViewHistory.text += "\n\(currentDataTime): +1"
        
        //прокрутка текста вниз
        scrollToBottom()
    }
    
    
    
    //функция кнопки "-"
    @IBAction func buttonMinusTap(_ sender: Any) {
        print ("Книга убрана")
        
        if counterValue > 0 {
            counterValue -= 1
            labelCounter.text = String(counterValue)
            
            let currentDataTime = dateFormatter.string(from: Date())
            textViewHistory.text += "\n\(currentDataTime): -1"
            
            //прокрутка текста вниз
            scrollToBottom()
        } else {
            // Попытка уменьшить значение ниже 0
            let currentDateTime = dateFormatter.string(from: Date())
            textViewHistory.text += "\n\(currentDateTime): Попытка уменьшить \nзначение счётчика ниже 0"
            
            // прокрутка до последней строки
            scrollToBottom()
        }
    }
    
    
    
    
    @IBAction func buttonResetTap(_ sender: Any) {
        print ("Счетчик сброшен, начнем заново")
        
        counterValue = 0
        labelCounter.text = String(counterValue)
        
        let currentDataTime = dateFormatter.string(from: Date())
        textViewHistory.text += "\n\(currentDataTime): Счётчик сброшен"
        
        //прокрутка вниз при сбросе
        scrollToBottom()
    }
}


