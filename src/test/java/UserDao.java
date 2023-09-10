public interface UserDao {
    public User getUserByName(String name);
    public int  setUserByName(String name,String pwd,String sex);
}
