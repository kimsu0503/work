package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerInfoDao {
	@Autowired
	SqlSessionFactory factory;
	
	public boolean join(Map map) {
		SqlSession session = factory.openSession();
		System.out.println(map);
		try {
			session.insert("seller.join",map);
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
			HashMap rst = session.selectOne("seller.login", map);
			System.out.println(rst);
			return rst != null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	//아이디 계좌번호 중복 체크/ 정보 보기 / 아이디, 비밀번호 찾기
	public Map overlapChk(String val, String mode) {
		SqlSession session = factory.openSession();
		Map map = new HashMap();
		try {
			switch(mode) {
			case "id" : 
				map = session.selectOne("seller.id_check", val);
				break;
			case "account":
				map = session.selectOne("seller.account_check", val);
				break;
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	
	//비밀번호 *표시로 바꾸기
	public String change(String str){
		StringBuilder sb = new StringBuilder(str);
		for(int i=2; i<sb.length(); i++){
			sb.setCharAt(i, '*');
		}
		return sb.toString();
	}
	
	
	//정보 수정
	public boolean editInfo(Map map) {
		System.out.println(map);
		SqlSession session = factory.openSession();
		try {
			session.update("seller.edit_info", map);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	//비밀번호 수정
		public boolean editPass(Map map) {
			System.out.println(map);
			SqlSession session = factory.openSession();
			try {
				session.update("seller.edit_pass", map);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}finally {
				session.close();
			}
		}
	
	//회원탈퇴
	public boolean delete(String id) {
		SqlSession session = factory.openSession();
		System.out.println(id);
		try {
			session.delete("seller.member_delete", id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	
	
}
