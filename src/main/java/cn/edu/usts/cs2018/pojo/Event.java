package cn.edu.usts.cs2018.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 8:46 PM
 */
public class Event
{
    private Integer eventid;
    private String eventname;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date starttime;
    private int length;
    private int curperson;
    private int maxperson;
    private int curmoney;
    private int totalmoney;


    public Event()
    {
    }

    @Override
    public String toString()
    {
        return "Event{" +
                "eventid=" + eventid +
                ", eventname='" + eventname + '\'' +
                ", content='" + content + '\'' +
                ", starttime=" + starttime +
                ", length=" + length +
                ", curperson=" + curperson +
                ", maxperson=" + maxperson +
                ", curmoney=" + curmoney +
                ", totalmoney=" + totalmoney +
                '}';
    }

    public int getCurmoney()
    {
        return curmoney;
    }

    public void setCurmoney(int curmoney)
    {
        this.curmoney = curmoney;
    }

    public int getCurperson()
    {
        return curperson;
    }

    public void setCurperson(int curperson)
    {
        this.curperson = curperson;
    }

    public Integer getEventid()
    {
        return eventid;
    }

    public void setEventid(Integer eventid)
    {
        this.eventid = eventid;
    }

    public String getEventname()
    {
        return eventname;
    }

    public void setEventname(String eventname)
    {
        this.eventname = eventname;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public Date getStarttime()
    {
        return starttime;
    }

    public void setStarttime(Date starttime)
    {
        this.starttime = starttime;
    }

    public int getLength()
    {
        return length;
    }

    public void setLength(int length)
    {
        this.length = length;
    }

    public int getMaxperson()
    {
        return maxperson;
    }

    public void setMaxperson(int maxperson)
    {
        this.maxperson = maxperson;
    }

    public int getTotalmoney()
    {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney)
    {
        this.totalmoney = totalmoney;
    }
}
