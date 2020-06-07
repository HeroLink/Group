package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.dao.base.IBaseDao;
import cn.edu.usts.cs2018.pojo.User;

public interface UserMapper extends IBaseDao<User>
{
    User findByUnamePwd(User user);

    User findByUid(Integer id);
}
