import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public Admin getAdminByName(String name) {
        RowMapper<Admin> rowMapper = new BeanPropertyRowMapper<>(Admin.class);
        try {
            Admin admin = jdbcTemplate.queryForObject("select * from bs_admin where name=?", rowMapper, name);
            return admin;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    @Override
    public int setAdminByName(String name, String pwd) {
        RowMapper<Admin> rowMapper = new BeanPropertyRowMapper<>(Admin.class);

        try {
            Admin admin = jdbcTemplate.queryForObject("select * from admin where name=?", rowMapper, name);
            return 0;
        } catch (EmptyResultDataAccessException e) {
            int admin1 = jdbcTemplate.update("insert into admin(name,pwd) values (?,?);", name, pwd);
            //System.out.println("注册成功");
            return admin1;
        }
    }
}
