//import targ.AdminDao;
//import com.cqcet.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Service
@Repository
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDao adminDao;
    @Override
    public int adminlogin(Admin admin) {
        Admin adminByName = adminDao.getAdminByName(admin.getName());
        if (adminByName!=null){
            if (adminByName.getPwd().equals(admin.getPwd())){
                return 1;
            }else {
                return -1;
            }
        }else {
            return 0;
        }
    }

    @Override
    public int adminregister(Admin admin) {
        int adminByName = adminDao.setAdminByName(admin.getName(),admin.getPwd());
        if (adminByName>0){
            return 1;
        }else if (adminByName<0){
            return -1;
        }else {
            return 0;
        }
    }
}
