package model;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDao {
	@Autowired
	DataSource ds;
	
	@Autowired
	SqlSessionFactory factory;
	
	public boolean join(Map map) {
		SqlSession session = factory.openSession();
		System.out.println(map);
		try {
			session.insert("member.join",map);
			session.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			return false;
		}finally {
			session.close();
		}
	}
	public boolean login(Map map) {
		SqlSession session = factory.openSession();
		try {
			HashMap rst = session.selectOne("member.login", map);
			return rst != null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	public Map id_check_repetition(String id) {
		SqlSession session = factory.openSession();
		System.out.println(id);
		HashMap rst = null;
		try {
			rst = session.selectOne("member.id_check", id);
			System.out.println("rst="+rst);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return rst;
	}
	public boolean email_check_repetition(String email) {
		SqlSession session = factory.openSession();
		try {
			HashMap rst = session.selectOne("member.email_check", email);
			return rst != null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}
}
