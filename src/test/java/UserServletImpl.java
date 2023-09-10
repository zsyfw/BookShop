//import com.cqcet.dao.UserDao;
//import com.cqcet.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public class UserServletImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public int login(User user) {
        User userByName = userDao.getUserByName(user.getName());
        if (userByName!=null){
            if (userByName.getPwd().equals(user.getPwd())){
                return 1;
            }else {
                return -1;
            }
        }else {
            return 0;
        }
    }

    @Override
    public int register(User user) {
        int userByName = userDao.setUserByName(user.getName(),user.getPwd(),user.getSex());
        if (userByName>0){
                return 1;
            }else if (userByName<0){
                return -1;
        }else {
            return 0;
        }
    }
}

