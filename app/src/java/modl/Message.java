/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modl;

/**
 *
 * @author admin
 */
public class Message {
    private String message;
    private String time;

    public Message() {
        super();
    }

    public Message(String message, String time) {
        this.message = message;
        this.time = time;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
}
