package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.dao.base.IBaseDao;
import cn.edu.usts.cs2018.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized;

public interface UserMapper extends IBaseDao<User>
{
    User findByUnamePwd(User user);

    User findByUid(Integer uid);

    User findByUname(String username);

    /**
     * 由于是多参数那么就不能使用parameterType， 这里用@Param来指定哪一个
     *
     * @param uid
     * @param username
     * @return
     */
    User findByUidUname(@Param("uid") Integer uid, @Param("username") String username);
}
