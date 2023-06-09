package com.goodjob.gongji.model;

import java.util.List;
import java.util.Map;

public interface GongJiDAO {
public List<GongJiDTO> userGongJiList(String subject,int start, int end);
public GongJiDTO gongJiContent(int idx);
public int gongJiInsert(GongJiDTO dto);
public int gongJiUpdate(GongJiDTO dto);
public int gongJiDel(int idx);
public List<GongJiDTO> manGongjiList(Map map);
public int manGongjiListTotalCnt();
public int userGongJiTotalCnt(String subject) ;
}
