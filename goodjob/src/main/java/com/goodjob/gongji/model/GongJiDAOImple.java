package com.goodjob.gongji.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class GongJiDAOImple implements GongJiDAO {
	private SqlSessionTemplate sqlMap;
	public GongJiDAOImple() {
		// TODO Auto-generated constructor stub
	}
	public GongJiDAOImple(SqlSessionTemplate sqlMap) {
		// TODO Auto-generated constructor stub
		this.sqlMap = sqlMap;
	}
	@Override
	public List<GongJiDTO> userGongJiList() {
		// TODO Auto-generated method stub
		
		return sqlMap.selectList("userGongJiList");
	}
	@Override
	public GongJiDTO gongJiContent(int idx) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("gongJiContent", idx);
	}
}
