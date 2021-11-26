////
////  ViewController.swift
////  ColculatorSwift
////
////  Created by Rinat on 25.11.2021.
////
//
import UIKit
import CLTypingLabel

enum Operation{
    case Add
    case Sub
    case Multiply
    case Divide
    case Null
}


class ViewController: UIViewController {
    @IBOutlet weak var cltyinglbl: CLTypingLabel!
    
    @IBOutlet weak var label: UILabel!
    var isNewValue = true
    var operations:String? = nil
    var oper:Operation? = nil
    var previousOperation:String? = nil
    var resault:Int = 0
    var newValue:Int = 0



    @IBAction func onZero(_ sender: Any) {
        addDigit(_digit: "0")
    }
    @IBAction func onOne(_ sender: Any) {
        addDigit(_digit: "1")
    }
    @IBAction func onTwo(_ sender: Any) {
        addDigit(_digit: "2")
    }
    @IBAction func onThree(_ sender: Any) {
        addDigit(_digit: "3")
    }
    @IBAction func onFour(_ sender: Any) {
        addDigit(_digit: "4")
    }
    @IBAction func onFive(_ sender: Any) {
        addDigit(_digit: "5")
    }
    @IBAction func onSix(_ sender: Any) {
        addDigit(_digit: "6")
    }
    @IBAction func onSeven(_ sender: Any) {
        addDigit(_digit: "7")
    }
    @IBAction func onEight(_ sender: Any) {
        addDigit(_digit: "8")
    }
    @IBAction func onNine(_ sender: Any) {
        addDigit(_digit: "9")
    }
    @IBAction func onEqual(_ sender: Any) {

       colculate1()
    }
    @IBAction func onDot(_ sender: Any) {
    }

    @IBAction func onAdd(_ sender: Any) {
        oper = .Add
        previousOperation = nil
        isNewValue = true
        resault = getInteger()
    }
    @IBAction func onSub(_ sender: Any) {

        oper = .Sub
        previousOperation = nil
        isNewValue = true
        resault = getInteger()
    }
    @IBAction func onMultiply(_ sender: Any) {
        oper = .Multiply
        previousOperation = nil
        isNewValue = true
        resault = getInteger()
    }
    @IBAction func onDivide(_ sender: Any) {
        oper = .Divide
        previousOperation = nil
        isNewValue = true
        resault = getInteger()

    }
    @IBAction func onReset(_ sender: Any) {
        oper = .Null
        isNewValue = true
        resault = 0
        newValue = 0
        label.text = "0"
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        cltyinglbl.text = "ColculatorSwift"
        
        
    }
    func addDigit(_digit:String){
        if isNewValue {
        label.text = ""
        isNewValue = false
        }
        var digits = label.text
        digits?.append(_digit)
        label.text = digits

    }
    func getInteger() ->Int {
        return Int(label.text ?? "0") ?? 0
    }


    func colculate1 (){
        guard let oper = oper else {
            return
        }


        if Operation.Null != oper {
            newValue = getInteger()
        }
        if oper == .Add{
            resault += newValue
            isNewValue = true
           
        }else if oper == .Sub {
            resault -= newValue
            isNewValue = true
            
            
        }else if oper == .Multiply {
            resault *= newValue
            isNewValue = true
            
            
        }else if oper == .Divide{

            if newValue != 0 {
            resault /= newValue
                isNewValue = true
               
                
            }else {
                resault = 0
          }

        }else {
            return
        }

        previousOperation = "\(oper)"
        label.text = "\(resault)"
        isNewValue = true
        }


    }







