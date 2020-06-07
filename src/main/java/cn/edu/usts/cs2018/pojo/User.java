package cn.edu.usts.cs2018.pojo;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/7/2020 12:39 PM
 */
public class User
{
    private Integer uid;
    private String username;
    private String password;
    private String gender;
    private String phone;
    private int identity;

    public User()
    {
    }

    @Override
    public String toString()
    {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", identity=" + identity +
                '}';
    }

    public Integer getUid()
    {
        return uid;
    }

    public void setUid(Integer uid)
    {
        this.uid = uid;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public int getIdentity()
    {
        return identity;
    }

    public void setIdentity(int identity)
    {
        this.identity = identity;
    }
}
