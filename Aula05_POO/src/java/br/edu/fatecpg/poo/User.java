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
public class User {
    private String name;
    private String email;
    private String password;
    
    public static ArrayList<User> getList(){
        ArrayList<User> list = new ArrayList<>();
        list.add(new User("admin1","admin1@domain.com","1234"));
        list.add(new User("admin2","admin2@domain.com","1234"));
        list.add(new User("admin3","admin3@domain.com","1234"));
        list.add(new User("admin4","admin4@domain.com","1234"));
        return list;
    }
    
    public User(String name, String email, String password){
        this.name=name;
        this.email=email;
        this.password=password;}

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
