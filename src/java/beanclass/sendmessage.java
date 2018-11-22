/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beanclass;

/**
 *
 * @author USER
 */
public class sendmessage {
    String userid;
   /// String pstn;
    String msgto;
    String usertype;
    String message;
    
    
   

    public String getuserid() {
        return userid;
    }

    public void setuserid(String userid) {
        this.userid = userid;
    }

   

    public String getmsgto() {
        return msgto;
    }

    public void setmsgto(String msgto) {
        this.msgto = msgto;
    }
    public String getmessage() {
        return message;
    }

    public void setmessage(String message) {
        this.message = message;
    }
    public String getusertype() {
        return usertype;
    }

    public void setusertype(String usertype) {
        this.usertype = usertype;
    }

    
    
}
