//
//  DatePickerHelper.swift
//  learningSwiftUI
//
//  Created by Julian González on 9/06/24.
//

import SwiftUI

struct DatePickerHelper: UIViewRepresentable {
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    public var placeHolder: String
    private let helper = Helper()
    
    @Binding public var date: Date?
    
    private let dateFormatted: DateFormatter = {
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "yyyy/MM/dd"
        return dateFormatted
    }()
    
    func makeUIView(context: Context) -> UITextField {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.textField.placeholder = placeHolder
        self.textField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: helper, action: #selector(helper.dateSelect))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        helper.done = {
            date = datePicker.date
            textField.resignFirstResponder()
        }
        
        return self.textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) { 
        if let selectedDate = date {
            uiView.text = dateFormatted.string(from: selectedDate)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        
    }
    
    class Helper {
        public var done: (() -> Void)?
        
        @objc func dateSelect() {
            self.done?()
        }
    }
}

