package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOracleDao implements AdminDao{

	@Autowired
	SqlSessionFactory factory;
	
	public boolean login(Map<String, Object> map){
		boolean b = false;
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("admin.login", map);
			if(r > 0){
				b = true;
			}
		}catch(Exception e){
			System.out.println("error.login : "+e.toString());
		}finally{
			session.close();
		}
		return b;
	}
	
	public int doc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_dailyOrder");
		}catch(Exception e){
			System.out.println("error.doc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int dpc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_dailyPay");
		}catch(Exception e){
			System.out.println("error.dpc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int duc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_dailyUser");
		}catch(Exception e){
			System.out.println("error.duc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int auc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_allUser");
		}catch(Exception e){
			System.out.println("error.auc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int luc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_leaveUser");
		}catch(Exception e){
			System.out.println("error.luc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int getCnt(String mapper){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne(mapper);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public boolean putValues(String mapper, Map map){
		boolean b = false;
		SqlSession session = factory.openSession();
		try{
			int r = session.insert(mapper, map);
			if(r > 0){
				b = true;
			}
			session.commit();
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public List<Map> getValues(String mapper){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try{
			rst = session.selectList(mapper);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public Map getValues(String mapper, int val){
		SqlSession session = factory.openSession();
		Map rst = null;
		try{
			rst = session.selectOne(mapper, val);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List<Map> getValues(String mapper, String table){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		Map map = new HashMap<>();
		map.put("table", table);
		try{
			rst = session.selectList(mapper, map);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List<Map> getValues(String mapper, Map map){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try{
			rst = session.selectList(mapper, map);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public boolean putImages(List list){
		SqlSession session = factory.openSession();
		boolean b = false;
		System.out.println("list? : "+list);
		Map map = new HashMap<>();
		map.put("list", list);
		try{
			int rst = session.insert("admin.putImage_notice", map);
			if(rst > 0){
				b = true;
				session.commit();
			}
		}catch(Exception e){
			System.out.println("error.putImages"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public List getDetatil_notice(int num){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try{
			rst = session.selectList("admin.getDetail_notice", num);
		}catch(Exception e){
			System.out.println("error.getDetatil_notice"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public boolean delNotice_img(int num){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			session.delete("admin.delNotice_img", num);
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.delNotice_img"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public boolean updateImage_notice(Map map){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			int rst = session.insert("admin.updateImage_notice", map);
			if(rst > 0){
				b = true;
				session.commit();
			}
		}catch(Exception e){
			System.out.println("error.updateImage_notice"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public List getInfo_company(){
		SqlSession session = factory.openSession();
		try{
			return session.selectList("admin.getInfo_company");
		}catch(Exception e){
			System.out.println("error.getInfo_company"+e.toString());
			return null;
		}finally{
			session.close();
		}
	}
	
	public boolean updateValues_info_company(List list){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			for(Object o : list){
				System.out.println("map : "+(Map)o);
				session.update("admin.updateInfo_company", (Map)o);
			}
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.updateValues_info_company"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public boolean delInfo_company(String name){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			session.delete("admin.delInfo_company", name);
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.delInfo_company"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public int plusInfo_company(String name){
		SqlSession session = factory.openSession();
		int rst = -1;
		try{
			session.insert("admin.plusInfo_company", name);
			rst = session.selectOne("admin.getNum_info_company", name);
			session.commit();
		}catch(Exception e){
			System.out.println("error.plusInfo_company"+e.toString());
			rst = -1;
			session.rollback();
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List getUuid_notice_img(){
		List list = null;
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("admin.getUUID_notice_img");
		}catch(Exception e){
			System.out.println("error.getUuid_notice_img"+e.toString());
			list = null;
		}finally{
			session.close();
		}
		return list;
	}
	
	public List getTerms(){
		List list = null;
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("admin.getTerms");
		}catch(Exception e){
			System.out.println("error.getTerms"+e.toString());
			list = null;
		}finally{
			session.close();
		}
		return list;
	}
	
	public List getDetail_terms(int num){
		List list = null;
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("admin.getDetail_terms", num);
		}catch(Exception e){
			System.out.println("error.getDetail_terms"+e.toString());
			list = null;
		}finally{
			session.close();
		}
		return list;
	}
	
	public boolean updateValues_terms(Map map){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			session.update("admin.updateTerms", map);
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.updateValues_terms"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public boolean plusTerms(Map map){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			session.insert("admin.plusTerms", map);
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.plusTerms"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public boolean delTerms(int num){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			session.delete("admin.delTerms", num);
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.delTerms"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public boolean delNotice(int num){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			session.delete("admin.delNotice", num);
			b = true;
			session.commit();
		}catch(Exception e){
			System.out.println("error.delNotice"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
}
