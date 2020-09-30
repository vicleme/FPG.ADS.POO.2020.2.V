/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.poo;
import java.util.Calendar;

/**
 *
 * @author Victor
 */
public class Pessoa {
    public String nome;
    public Pessoa mãe;
    public Pessoa pai;
    public java.util.Date nascimento;
    public int getIdade(){
        if(nascimento==null) { return 0;
        } else {
            Calendar hoje = Calendar.getInstance();
            Calendar nasc = Calendar.getInstance();
            nasc.setTime(nascimento);
            return (hoje.get(Calendar.YEAR) - nasc.get(Calendar.YEAR));
        }
    }
}
