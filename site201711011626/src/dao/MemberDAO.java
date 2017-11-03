package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBManager;
import dto.MemberDTO;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	MemberDTO mDto;

	public int Insert(MemberDTO mDto) {
		int value = 0;
		try {
			conn = DBManager.getConnection();

			String sql = "INSERT INTO shopmember(shopid,shoppw,shopname,shopaddr,shopaddr2,shopaddr3,shopphone,shopemail) "
					+ " VALUES(?,?,?,?,?,?,?,?) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mDto.getShopid());
			pstmt.setString(2, mDto.getShoppw());
			pstmt.setString(3, mDto.getShopname());
			pstmt.setString(4, mDto.getShopaddr());
			pstmt.setString(5, mDto.getShopaddr2());
			pstmt.setString(6, mDto.getShopaddr3());
			pstmt.setString(7, mDto.getShopphone());
			pstmt.setString(8, mDto.getShopemail());

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("Insert�꽦怨�");
				value = 10;

			} else {
				System.out.println("Insert�떎�뙣");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return value;
	}

	public int Search1(String shopid) {

		int result = 0;
		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM shopmember WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, shopid);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				shopid = rs.getString("shopid");
				String shopname = rs.getString("shopname");
				String shopaddr = rs.getString("shopaddr");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopaddr3 = rs.getString("shopaddr3");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				Date regdate = rs.getDate("regdate");

				MemberDTO mDto = new MemberDTO(shopid, shopname, shopaddr, shopaddr2, shopaddr3, shopphone, shopemail,
						regdate);
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return result;
	}

	public ArrayList<MemberDTO> Search(String shopid) {

		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM shopmember WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, shopid);
			rs = pstmt.executeQuery();
			list.clear();

			while (rs.next()) {

				shopid = rs.getString("shopid");
				String shopname = rs.getString("shopname");
				String shopaddr = rs.getString("shopaddr");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopaddr3 = rs.getString("shopaddr3");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				Date regdate = rs.getDate("regdate");

				MemberDTO mDto = new MemberDTO(shopid, shopname, shopaddr, shopaddr2, shopaddr3, shopphone, shopemail,
						regdate);
				list.add(mDto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return list;
	}

	// 2.占쎈땾占쎌젟

	public void Modify(MemberDTO mDto) {

		try {
			list.clear();
			conn = DBManager.getConnection();

			// 3. SQL �뜝�뙗�눦�삕
			String sql = "UPDATE shopmember " + "SET shopname = ?, " + "shopaddr = ?,  " + "shopaddr2 = ?,  "
					+ "shopaddr3 = ?,  " + "shopphone = ?, " + "shopemail = ? " + "WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getShopname());
			pstmt.setString(2, mDto.getShopaddr());
			pstmt.setString(3, mDto.getShopaddr2());
			pstmt.setString(4, mDto.getShopaddr3());
			pstmt.setString(5, mDto.getShopphone());
			pstmt.setString(6, mDto.getShopemail());
			pstmt.setString(7, mDto.getShopid());

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("�뾽�뜲�씠�듃�꽦怨�");
			} else {
				System.out.println("�뾽�뜲�씠�듃�떎�뙣");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	public MemberDTO ckLogin(String id, String pw) {

		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM shopmember WHERE shopid = ? AND shoppw = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				String shopid = rs.getString("shopid");
				String shopname = rs.getString("shopname");
				String shopaddr = rs.getString("shopaddr");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopaddr3 = rs.getString("shopaddr3");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				Date regdate = rs.getDate("regdate");

				mDto = new MemberDTO(shopid, shopname, shopaddr, shopaddr2, shopaddr3, shopphone, shopemail, regdate);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mDto;
	}

	public String Login(String id) {
		String logid = null;
		try {

			conn = DBManager.getConnection();
			String sql = "SELECT shopid FROM shopmember WHERE id= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String shopid = rs.getString("shopid");
				logid = shopid;
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return logid;
	}

}
