package cn.edu.usts.cs2018.pojo;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 8:47 PM
 */
public class Member
{
    private Integer eventid;

    private Integer uid;


    /**
     * 成为活动领导人为1，非领导人为0
     */
    private Integer isleader;

    private Integer payment;
    /**
     * 同意加入活动为1，不同意为0
     */
    private Integer accept;

    public Member()
    {
    }

    @Override
    public String toString()
    {
        return "Member{" +
                "eventid=" + eventid +
                ", uid=" + uid +
                ", isleader=" + isleader +
                ", payment=" + payment +
                ", accept=" + accept +
                '}';
    }

    public Integer getAccept()
    {
        return accept;
    }

    public void setAccept(Integer accept)
    {
        this.accept = accept;
    }

    public Integer getEventid()
    {
        return eventid;
    }

    public void setEventid(Integer eventid)
    {
        this.eventid = eventid;
    }

    public Integer getUid()
    {
        return uid;
    }

    public void setUid(Integer uid)
    {
        this.uid = uid;
    }

    public Integer getIsleader()
    {
        return isleader;
    }

    public void setIsleader(Integer isleader)
    {
        this.isleader = isleader;
    }

    public Integer getPayment()
    {
        return payment;
    }

    public void setPayment(Integer payment)
    {
        this.payment = payment;
    }
}
