package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CccenterDao {
	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> faq(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.faq");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public int faq_cnt(Map map) {
		SqlSession session = factory.openSession();
		try {
			int cnt = session.selectOne("cccenter.faq_sort_count",map);
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			session.close();
		}
	}
	public List<Map> faqpage(Map map){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.faq_sort_page", map);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> notice(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.notice");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> noticeAll(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.noticeAll");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public Map noticeOne(String num) {
		Map map = new HashMap<>();
		SqlSession session = factory.openSession();
		try {
			map = session.selectOne("cccenter.one_notice", num);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> faqsearch(Map map){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.faq_search",map);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
}
