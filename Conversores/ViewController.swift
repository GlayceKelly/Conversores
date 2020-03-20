//
//  ViewController.swift
//  Conversores
//
//  Created by Glayce on 19/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Controles da tela
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Funcao de acao do botao que muda o tipo da conversao
    @IBAction func showNext(_ sender: UIButton) {
        //Conforme o texto da label muda o nome da descricao e do titulo dos botoes ao clicar no proximo
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        
        //Chama a funcao que realiza as conversoes de valores conforme o item
        convert(nil)
    }
    
    //Funcao dos botoes de tipos de conversao
    @IBAction func convert(_ sender: UIButton?) {
        //Altera o alpha dos botoes, deixando o botao selecionado com alpha 0.5
        if let sender = sender{
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        //Realiza o calculo das conversoes conforme o texto da descricao
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        
        //Obtem o resultado e formata para ficar com duas casas decimais
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
        
        //Fecha o teclado
        view.endEditing(true)
    }
    
    func calcTemperature(){
        //guard mantem a variavel para o resto do codigo conseguir utilizar
        guard let temperature = Double(tfValue.text!) else {return}
        
        //Realiza o calculo da temperatudo conforme o alpha do botao
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        //guard mantem a variavel para o resto do codigo conseguir utilizar
        guard let weight = Double(tfValue.text!) else {return}
        
        //Realiza o calculo do peso conforme o alpha do botao
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        } else {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency(){
        //guard mantem a variavel para o resto do codigo conseguir utilizar
        guard let currency = Double(tfValue.text!) else {return}
        
        //Realiza o calculo da conversao de valores conforme o alpha do botao
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 5.10)
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 5.10)
        }
    }
    
    func calcDistance(){
        //guard mantem a variavel para o resto do codigo conseguir utilizar
        guard let distance = Double(tfValue.text!) else {return}
        
        //Realiza o calculo da distancia conforme o alpha do botao
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(distance / 1000.0)
        } else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000.0)
        }
    }
}

