package cn.edu.usts.cs2018.service.base;

import cn.edu.usts.cs2018.pojo.User;

public interface IUserService
{
    User login(User user);

    boolean register(User user);

    boolean modify(User user);

}
