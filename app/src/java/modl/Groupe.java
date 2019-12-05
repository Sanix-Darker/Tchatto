/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modl;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Groupe {
    private int nbreUsers;
    private String code; //Le code du groupe est un peu comme le nom de ce groupe
    List<String> users ;
    List<String> message ;

    public Groupe() {
        super();
    }

    public Groupe(int nbreUser, String code, List Users) {
        this.nbreUsers = nbreUser;
        this.code = code;
        this.users = Users;
    }

    public int getNbreUser() {
        return nbreUsers;
    }

    public void setNbreUser(int nbreUser) {
        this.nbreUsers = nbreUser;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List getUsers() {
        return users;
    }

    public void addUsers(String u) {
        this.users.add(u);
    }

    public List getMessage() {
        return message;
    }

    public void addMessage(String m) {
        this.message.add(m);
    }

}
