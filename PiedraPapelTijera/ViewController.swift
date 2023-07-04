//
//  ViewController.swift
//  PiedraPapelTijera
//
//  Created by ADMIN UNACH on 03/07/23.
//

import UIKit

class ViewController: UIViewController {
    var estado = GameState.Comienzo
    var maquina : Sign?
    var usuaario : Sign?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        validacionEstado()
        
    }


    @IBOutlet weak var superiorLabel: UILabel!
    @IBOutlet weak var inferiorLAbel: UILabel!
    @IBOutlet weak var piedraButton: UIButton!
    @IBOutlet weak var papelButton: UIButton!
    @IBOutlet weak var tijeraButon: UIButton!
    @IBOutlet weak var denuevoButton: UIButton!
    @IBAction func piedraAction(_ sender: UIButton) {
        usuaario = Sign.piedra
        guard let user = usuaario else {return}
        print("presionado",user)
        play(sign:user)
        validacionEstado()
    }
    @IBAction func papelAction(_ sender: UIButton) {
        usuaario = Sign.papel
        guard let user = usuaario else {return}
        print("presionado",user)
        play(sign:user)
        validacionEstado()
    }
    @IBAction func tijeraAction(_ sender: UIButton) {
        usuaario = Sign.tijera
        guard let user = usuaario else {return}
        print("presionado",user)
        play(sign:user)
        validacionEstado()
    }
    @IBAction func denuevoAction(_ sender: UIButton) {
        estado = GameState.Comienzo
        validacionEstado()
    }
    
    func validacionEstado(){
        print("validacion",estado)
        if estado == GameState.Comienzo {
            maquina = randomSign()
            superiorLabel.text = "🤖"
            inferiorLAbel.text = "Piedra, Papel o Tijeras"
            denuevoButton.isHidden = true
            piedraButton.isHidden = false
            papelButton.isHidden = false
            tijeraButon.isHidden = false
            self.view.backgroundColor = UIColor.gray

        } else if estado == GameState.Victoria {
            self.view.backgroundColor = UIColor.green
            superiorLabel.text = maquina?.emoji
            inferiorLAbel.text = "Ganaste"
            denuevoButton.isHidden = false
            if usuaario == .piedra {
                papelButton.isHidden = true
                tijeraButon.isHidden = true
            }else if usuaario == .papel {
                piedraButton.isHidden = true
                tijeraButon.isHidden = true
            }else if usuaario == .tijera {
                piedraButton.isHidden = true
                papelButton.isHidden = true
            }
        }else if estado == GameState.Empate {
            self.view.backgroundColor = UIColor.green
            superiorLabel.text = maquina?.emoji
            inferiorLAbel.text = "Empate"
            denuevoButton.isHidden = false
            if usuaario == .piedra {
                papelButton.isHidden = true
                tijeraButon.isHidden = true
            }else if usuaario == .papel {
                piedraButton.isHidden = true
                tijeraButon.isHidden = true
            }else if usuaario == .tijera {
                piedraButton.isHidden = true
                papelButton.isHidden = true
            }
        }else if estado == GameState.Derrota {
            self.view.backgroundColor = UIColor.green
            superiorLabel.text = maquina?.emoji
            inferiorLAbel.text = "Perdiste"
            denuevoButton.isHidden = false
            if usuaario == .piedra {
                papelButton.isHidden = true
                tijeraButon.isHidden = true
            }else if usuaario == .papel {
                piedraButton.isHidden = true
                tijeraButon.isHidden = true
            }else if usuaario == .tijera {
                piedraButton.isHidden = true
                papelButton.isHidden = true
            }
        }
    }
    
    
    func play(sign : Sign){
        print("play",sign)
        if sign == .piedra && maquina == .piedra {
            estado = GameState.Empate
        }else if sign == .piedra && maquina == .tijera{
            estado = GameState.Victoria
        }else if sign == .piedra && maquina == .papel{
            estado = GameState.Derrota
        }
        
        if sign == .papel && maquina == .piedra {
            estado = GameState.Victoria
        }else if sign == .papel && maquina == .tijera{
            estado = GameState.Derrota
        }else if sign == .papel && maquina == .papel{
            estado = GameState.Empate
        }
        
        if sign == .tijera && maquina == .piedra {
            estado = GameState.Derrota
        }else if sign == .tijera && maquina == .tijera{
            estado = GameState.Empate
        }else if sign == .tijera && maquina == .papel{
            estado = GameState.Victoria
        }
        
    }
}

