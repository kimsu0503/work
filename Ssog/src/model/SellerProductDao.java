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
	
	@Autowired
	Paging paging;
	
	public List<Map<String,Object>> productList(Map map){
		SqlSession session = factory.openSession();
		try {
			List<Map<String,Object>> list =  session.selectList("seller.pro_list", map);
			paging.setRecordsPerPage(10);
			paging.setStartPageNo(1);
			
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
			//System.out.println("countAll: " + r);
			return r;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return 0;
		} finally{
			session.close();
		}
	}
}
