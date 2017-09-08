package model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import paging.Paging;

@Service
public class SellerProductDao {
	@Autowired
	SqlSessionFactory factory;
	
	
	public List<Map<String,Object>> productList(Map map){
		SqlSession session = factory.openSession();
		try {
			List<Map<String,Object>> list =  session.selectList("seller.pro_list", map);
			session.commit();
			return list;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return null;
		} finally{
			session.close();
		}
	}
	
	//글이 총 몇개인지
	public Integer totalList(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("seller.countAll", map);
			return r;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return 0;
		} finally{
			session.close();
		}
	}
	
	//중분류 카테고리
	public List<Map<String,Object>> smallcateList(){
		SqlSession session = factory.openSession();
		try {
			List<Map<String,Object>> list =  session.selectList("small_cate");
			session.commit();
			return list;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return null;
		} finally{
			session.close();
		}
	}
	
}
