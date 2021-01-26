package com.project3.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.project3.vo.IdusBoardVO;

public class IdusBoardDAO extends DBConn{
	/**
	 * CS 전체 리스트
	 */
	public ArrayList<IdusBoardVO> getList() {
		ArrayList<IdusBoardVO> list = new ArrayList<IdusBoardVO>();
		
		try {
			String sql = "select rownum rno, bid, btitle, bcontent, bfile, bsfile, bpass, to_char(bdate, 'yyyy.mm.dd') bdate, bhits, uemail, uname, bsecret from (select * from idus_board order by bdate desc)";
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				IdusBoardVO vo = new IdusBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBcontent(rs.getString(4));
				vo.setBfile(rs.getString(5));
				vo.setBsfile(rs.getString(6));
				vo.setBpass(rs.getString(7));
				vo.setBdate(rs.getString(8));
				vo.setBhits(rs.getInt(9));
				vo.setUemail(rs.getString(10));
				vo.setUname(rs.getString(11));
				vo.setBsecret(rs.getString(12));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * CS 글쓰기
	 */
	public boolean getInsert(IdusBoardVO vo) {
		boolean result = false;
		
		try {
			String sql = "insert into idus_board values('b_'||idus_board_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());
			pstmt.setString(5, vo.getBpass());
			pstmt.setInt(6, vo.getBhits());
			//pstmt.setString(7, vo.getUemail());
			//pstmt.setString(8, vo.getUname());
			pstmt.setString(7, "jihye@naver.com");
			pstmt.setString(8, "지혜");
			pstmt.setString(9, vo.getBsecret());
			
			int count = pstmt.executeUpdate();
			if(count != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * CS 내용
	 */
	public IdusBoardVO getContent(String id) {
		IdusBoardVO vo = new IdusBoardVO();
		
		try {
			String sql = "select bid, btitle, bcontent, bfile, bsfile, bpass, to_char(bdate, 'yyyy.mm.dd'), bhits, uemail, uname, bsecret from idus_board where bid = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setBid(rs.getString(1));
				vo.setBtitle(rs.getString(2));
				vo.setBcontent(rs.getString(3));
				vo.setBfile(rs.getString(4));
				vo.setBsfile(rs.getString(5));
				vo.setBpass(rs.getString(6));
				vo.setBdate(rs.getString(7));
				vo.setBhits(rs.getInt(8));
				vo.setUemail(rs.getString(9));
				vo.setUname(rs.getString(10));
				vo.setBsecret(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	/**
	 * CS 수정(파일 O)
	 */
	public boolean getUpdate(IdusBoardVO vo) {
		boolean result = false;
		
		try {
			String sql = "update idus_board set btitle=?, bcontent=?, bfile=?, bsfile=?, bsecret=? where bid = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());
			pstmt.setString(5, vo.getBsecret());
			pstmt.setString(6, vo.getBid());

			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * CS 수정(파일 X)
	 */
	public boolean getUpdateNoFile(IdusBoardVO vo) {
		boolean result = false;
		
		try {
			String sql = "update idus_board set btitle=?, bcontent=?, bsecret=? where bid = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBsecret());
			pstmt.setString(4, vo.getBid());

			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * CS 삭제
	 */
	public boolean getDelete(String id) {
		boolean result = false;
		
		try {
			String sql = "delete from idus_board where bid = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * CS 조회수 업데이트
	 */
	public int getUpdateHits(String id) {
		int hits = 0;
		
		try {
			String sql = "update idus_board set bhits = bhits+1 where bid = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);

			hits = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return hits;
	}
}
