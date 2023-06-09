package com.goodjob.sales.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class SalesDAOImple implements SalesDAO {

	SqlSession sqlMap;
	public SalesDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public SqlSession getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSession sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<SalesDTO> salesGetPeriod(Map<String,String> map) {
		List<SalesDTO> lists=sqlMap.selectList("salesGetPeriod",map);
		return lists;
	}
	
	@Override
	public List<SalesDTO> salesGetMonth(Map<String,String> map) {
		List<SalesDTO> lists=sqlMap.selectList("salesGetMonth", map);
		return lists;
	}
	@Override
	public List<SalesListDTO> salesGetPayList(Map<String, Object> map) {
		List<SalesListDTO> lists=sqlMap.selectList("salesGetPayList", map);
		return lists;
	}
	@Override
	public int salesPayListTotalCnt(Map<String, Object> map) {
		int result=sqlMap.selectOne("salesPayListTotalCnt", map);
		return result;
	}
}
