public interface AdminDao {
    public Admin getAdminByName(String name);
    public int  setAdminByName(String name,String pwd);
}
