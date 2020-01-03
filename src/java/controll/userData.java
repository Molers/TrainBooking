package controll;


public class userData {
    public  String name , userName, password, email;
    public int id = 0;
    
    public userData(){
        name = "";
        email = "";
        userName = "";
        password = "";
        id = 0;
    }
    
    public void setID(int id){
        this.id = id;
    }
    
    public int getID()  {
        return id;
    }
    
    public void setName (String name){
       this.name = name;
    }
    
    public String getName()  {
        return name;
    }
    
    public void setuserName(String user){
        this.userName = user;
    }
    
    public String getuserName()  {
        return userName;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getemail()  {
        return email;
    }
    
    public void setPass(String pass){
        this.password = pass;
    }
    public String getPass()  {
        return password;
    }
}
