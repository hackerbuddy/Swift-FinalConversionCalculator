//
//  ConverterViewController.swift
//  ConversionCalculatorUI
//
//  Created by boborama on 4/25/18.
//  Copyright © 2018 hackerbuddy. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var numberString = "";
    var numberDouble: Double = 0.0
    var currentInputUnit = "";
    var currentOutputUnit = "";
    var canAddDecimalPoint = true;
    var numberIsPositive = true;
    var inputExists = false;
    
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var conversion:[Converter] = [Converter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversion.append(Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        conversion.append(Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        conversion.append(Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        conversion.append(Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
        
        
        //default values
        self.currentInputUnit = conversion[0].inputUnit
        self.currentOutputUnit = conversion[0].outputUnit
        self.inputDisplay.text = conversion[0].inputUnit
        self.outputDisplay.text = conversion[0].outputUnit
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertAction(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        for converter in conversion{
        alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler:{
            (alertAction) -> Void in
            //handle first option
            self.currentOutputUnit = converter.outputUnit
            self.currentInputUnit = converter.inputUnit
            self.inputDisplay.text = converter.inputUnit
            self.outputDisplay.text = converter.outputUnit
            self.buttonWasPressed()
            
        }))
        }
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //IBAction methods for all of our buttons../
    
    @IBAction func zeroButton(_ sender: Any) {
        appendNumber(number: "0")
        buttonWasPressed()
    }
    
    @IBAction func decimalDotButton(_ sender: Any) {
        if(canAddDecimalPoint){
        appendNumber(number: ".")
        buttonWasPressed()
        canAddDecimalPoint = false;
        }
        
    }
    
    @IBAction func oneButton(_ sender: Any) {
        appendNumber(number: "1")
        buttonWasPressed()
    }
    
    @IBAction func twoButton(_ sender: Any) {
        appendNumber(number: "2")
        buttonWasPressed()
    }
    
    @IBAction func threeButton(_ sender: Any) {
        appendNumber(number: "3")
        buttonWasPressed()
    }
    
    @IBAction func fourButton(_ sender: Any) {
        appendNumber(number: "4")
        buttonWasPressed()
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        appendNumber(number: "5")
        buttonWasPressed()
    }
    
    @IBAction func sixButton(_ sender: Any) {
        appendNumber(number: "6")
        buttonWasPressed()
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        appendNumber(number: "7")
        buttonWasPressed()
    }
    
    @IBAction func eightButton(_ sender: Any) {
        appendNumber(number: "8")
        buttonWasPressed()
    }
    
    @IBAction func nineButton(_ sender: Any) {
        appendNumber(number: "9");
        buttonWasPressed()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        clearInput()
    }
    
    @IBAction func togglePositiveNegativeButton(_ sender: Any) {
        
        if(inputExists && numberIsPositive || inputExists && !numberIsPositive){
            if (numberIsPositive){
                numberIsPositive = false;
            }
            else{
                numberIsPositive = true;
            }
        }
        else if (!inputExists && numberIsPositive){
            numberIsPositive = false
        }
    }
    
    func appendNumber(number: String){
       
       
        
        if (numberIsPositive){
            numberString = numberString + number
            numberDouble = Double(numberString)!
            self.inputDisplay.text = numberString + " " + self.currentInputUnit;
        }
        else{ //if not positive...
            numberString = numberString + number
            numberDouble = (-1) * Double(numberString)!
            self.inputDisplay.text = "-" + numberString + " " + self.currentInputUnit;
        }
        inputExists = true;
    
    }
    
    func clearInput(){
        self.inputDisplay.text = self.currentInputUnit;
        self.outputDisplay.text = self.currentOutputUnit;
        numberDouble = 0;
        numberString = "";
        canAddDecimalPoint = true;
        numberIsPositive = true;
        inputExists = false;
    }
    
    func buttonWasPressed (){
        
        switch(self.currentInputUnit){
            
                case "°F": let tempInFahrenheit = numberDouble
                           let tempInCelcius = (tempInFahrenheit - 32) / (1.8)
                           self.outputDisplay.text = String(tempInCelcius) + " " + self.currentOutputUnit
                           self.inputDisplay.text = String(tempInFahrenheit);
                           break
            
                case "°C": let tempInCelcius = numberDouble
                           let tempInFahrenheit = (tempInCelcius * 1.8) + 32
                           self.outputDisplay.text = String(tempInFahrenheit) + " " + self.currentOutputUnit
                           self.inputDisplay.text = String(tempInCelcius);
                           break
            
                case "mi": let miles = numberDouble
                           let kilometers = miles * 1.609344
                           self.outputDisplay.text = String(kilometers) + " " + self.currentOutputUnit
                           self.inputDisplay.text = String(miles);
                           break
            
                case "km": let kilometers = numberDouble
                           let miles = kilometers / 1.609344
                           self.outputDisplay.text = String(miles) + " " + self.currentOutputUnit
                           self.inputDisplay.text = String(kilometers);
                           break
            
                default :
                    
                          break
            
        }
        
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
