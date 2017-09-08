package model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberDao {

	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> user_list(Map map){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try{
			rst = session.selectList("admin_member.user_list", map);
		}catch(Exception e){
			System.out.println("error.user_list"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public int user_list_count(Map map){
		SqlSession session = factory.openSession();
		int rst = -1;
		try{
			rst = session.selectOne("admin_member.user_list_count", map);
		}catch(Exception e){
			System.out.println("error.user_list_count"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
}
