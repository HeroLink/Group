package cn.edu.usts.cs2018.service.base;

import cn.edu.usts.cs2018.pojo.User;

import java.util.List;

public interface IUserService extends IBaseService<User>
{
    User login(User user);

    /**
     * @Description:
     * @param: user
     * @return: 1：注册成功，0：用户名已存在，<0：注册失败
     */
    int register(User user);

    User findByUnamePwd(User user);

    User findByUid(Integer id);

    User findByUname(String username);

    User findByUidUname(Integer id, String username);
}
