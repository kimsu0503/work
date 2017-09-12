package model;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	public boolean login(Map<String, Object> map);
	public int doc();
	public int dpc();
	public int duc();
	public int auc();
	public int luc();
	public int getCnt(String mapper);
	public boolean putValues(String mapper, Map map);
	public List<Map> getValues(String mapper);
	public Map getValues(String mapper, int val);
	public List<Map> getValues(String mapper, String table);
	public List<Map> getValues(String mapper, Map map);
	public boolean putImages(List list);
	public List getInfo_company();
	public boolean updateValues_info_company(List list);
	public boolean delInfo_company(String name);
	public int plusInfo_company(String name);
	public List getUuid_notice_img();
	public List getTerms(Map map);
	public List getDetail_terms(int num);
	public boolean updateValues_terms(Map map);
	public boolean plusTerms(Map map);
	public boolean delTerms(int num);
	public List getDetatil_notice(int num);
	public boolean delNotice_img(int num);
	public boolean updateImage_notice(Map map);
	public boolean delNotice(int num);
	public List getTarget_notice();
	public int getCount_notice(Map map);
	public int getCount_terms(Map map);
	public int getCount_counsel_user(Map map);
	public int getCount_counsel_seller(Map map);
	public List getList_counsel_user(Map map);
	public List getList_counsel_seller(Map map);
	public List getCounsel_category();
	public List getCounsel_user_detail(int num);
	public boolean updateCounsel_user_detail(Map map);
}