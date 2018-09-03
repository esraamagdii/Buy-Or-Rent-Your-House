/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.util.ArrayList;

/**
 *
 * @author Esraa
 */
public class User {
    private String Name;
    private String Password;
    private String Email;
    private String Phone;
    private String Gender;
    private String Birthdate;
    private boolean checkadmin;
    public byte[] ProfilePic ;
    private boolean checkAdmin;
    public ArrayList<Advertise> my_Advertisements;
    public ArrayList<Advertise> notification;
    
    public User()
    {
        
    }

    public User(String Name, String Password, String Email, String Phone, String Gender, String Birthdate, boolean checkadmin, byte[] ProfilePic, boolean checkAdmin, ArrayList<Advertise> my_Advertisements, ArrayList<Advertise> notification) {
        this.Name = Name;
        this.Password = Password;
        this.Email = Email;
        this.Phone = Phone;
        this.Gender = Gender;
        this.Birthdate = Birthdate;
        this.checkadmin = checkadmin;
        this.ProfilePic = ProfilePic;
        this.checkAdmin = checkAdmin;
        this.my_Advertisements = my_Advertisements;
        this.notification = notification;
    }

    public void setCheckadmin(boolean checkadmin) {
        this.checkadmin = checkadmin;
    }

    public boolean getCheckadmin()
    {
        return checkAdmin;
    }

    public void setCheckAdmin(boolean checkAdmin) {
        this.checkAdmin = checkAdmin;
    }
    public boolean getCheckAdmin()
    {
        return checkAdmin;
    }
    

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getName() {
        return Name;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getEmail() {
        return Email;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getPassword() {
        return Password;
    }

    public void setBirthdate(String Birthdate) {
        this.Birthdate = Birthdate;
    }

    public String getBirthdate() {
        return Birthdate;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getGender() {
        return Gender;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getPhone() {
        return Phone;
    }

    public byte[] getProfilePic() {
        return this.ProfilePic;
    }
    
    
}
