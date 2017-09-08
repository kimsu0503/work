package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDao {

	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> pro_list(Map map){
		List<Map> list = new ArrayList<>();
		SqlSession session=factory.openSession();
		try {
		System.out.println(map);
		list=session.selectList("product.pro_list", map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		session.close();
		}		
		return list;
	}
	
	public int paging(Map map) {
		int n=0;
		SqlSession session=factory.openSession();
		try {
			n=session.selectOne("list_count", map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return n;
	}
	public List<Map> Totalsearch(Map map) {
		List<Map> list = new ArrayList<>();
		SqlSession session=factory.openSession();
		try {
			list=session.selectList("product.totalsearch", map);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
			session.close();
			}		
			return list;
	}
	public int searchpaging(Map map) {
		int r=0;
		SqlSession session=factory.openSession();
		try {
			r=session.selectOne("totalsearch_count", map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return r;
	}
	public List<Map> originlist(){
		List<Map> list=new ArrayList<>();
		SqlSession session=factory.openSession();
		try {
			list=session.selectList("originlist");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return list;
	}
	
	public Map pro_detail(String num){
		Map map=new HashMap<>();
		SqlSession session=factory.openSession();
		try {
			map=session.selectOne("productdetail", num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return map;
	}
}