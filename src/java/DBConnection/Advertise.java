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
public class Advertise {
    
    private String Description;
    private String Status;
    private String Type;
    private String Location;
    private String UserEmail;
    private String Contact;
    private ArrayList<Comments> comments;
    private String[] photos;
    private double size;
    private int rate;
    private int floor;
    private int id;
    public ArrayList<byte[]> AdvertisePics ;
    public Advertise()
    {
        
    }

    public Advertise(String Description, String Status, String Type, String Location, String UserEmail, String Contact, ArrayList<Comments> comments, String[] photos, double size, int rate, int floor, int id, ArrayList<byte[]> AdvertisePics) {
        this.Description = Description;
        this.Status = Status;
        this.Type = Type;
        this.Location = Location;
        this.UserEmail = UserEmail;
        this.Contact = Contact;
        this.comments = comments;
        this.photos = photos;
        this.size = size;
        this.rate = rate;
        this.floor = floor;
        this.id = id;
        this.AdvertisePics = AdvertisePics;
    }

    

   

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    
    public void setAdvertisePics(ArrayList<byte[]> AdvertisePics) {
        this.AdvertisePics = AdvertisePics;
    }

    public ArrayList<byte[]> getAdvertisePics() {
        return AdvertisePics;
    }

    public void setComments(ArrayList<Comments> comments) {
        this.comments = comments;
    }

    public ArrayList<Comments> getComments() {
        return comments;
    }

    
    
    public void AddComment (Comments comment)
    {
        this.comments.add(comment);
    }
    
    public void CalculateRate(int rate)
    {
        this.rate +=rate;
    }
    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getDescription() {
        return Description;
    }

    public void setContact(String Contact) {
        this.Contact = Contact;
    }

    public String getContact() {
        return Contact;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public int getFloor() {
        return floor;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public String getLocation() {
        return Location;
    }

    public void setPhotos(String[] photos) {
        this.photos = photos;
    }

    public String[] getPhotos() {
        return photos;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getRate() {
        return rate;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public double getSize() {
        return size;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getStatus() {
        return Status;
    }
    
    
    public void setType(String Type) {
        this.Type = Type;
    }

    public String getType() {
        return Type;
    }

    public void setUserEmail(String UserEmail) {
        this.UserEmail = UserEmail;
    }

    public String getUserEmail() {
        return UserEmail;
    }
    
    
    
    
}
