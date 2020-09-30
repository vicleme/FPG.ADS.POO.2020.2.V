/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.poo;
import java.util.ArrayList;

/**
 *
 * @author Victor
 */
public class Contato {
    private String name;
    private String telefone;
    private String email;
    
    public static ArrayList<Contato> getList(){
        ArrayList<Contato> list = new ArrayList<>();
        list.add(new Contato("contato1","contato1@domain.com","11900000000"));
        list.add(new Contato("contato2","contato2@domain.com","11900000000"));
        list.add(new Contato("contato3","contato3@domain.com","11900000000"));
        list.add(new Contato("contato4","contato4@domain.com","1100000000"));
        return list;
    }
    
    private String formatarNumero(String tipo, String numero) {
 
    numero=numero.replaceAll("\\D", "");
    String mascara="";
   
    if (tipo.equalsIgnoreCase("telefone")) {
		mascara= "(##) #####-####"; //Celulares
		if (numero.length()==10) mascara="(##) ####-####"; //Telefones fixos
    }
        
	try {
		javax.swing.text.MaskFormatter formatadorNumero = new javax.swing.text.MaskFormatter(mascara);
		javax.swing.JFormattedTextField txtNumero = new javax.swing.JFormattedTextField(formatadorNumero);
		txtNumero.setText(numero);
		return txtNumero.getText();
	} catch (java.text.ParseException e) {
		e.printStackTrace();
		return "";
	}
	
 }
    
    public Contato(String name, String email, String telefone){
        this.name=name;
        this.email=email;
        this.telefone=formatarNumero("telefone", telefone);}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
