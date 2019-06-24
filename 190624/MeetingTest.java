package model.dao;

import java.util.ArrayList;

import org.junit.Test;

import model.vo.MeetingVO;

public class MeetingTest {

	@Test
	public void test() {
		MeetingJDBCDAO dao = new MeetingJDBCDAO();
		MeetingVO vo = new MeetingVO();
		vo.setName("라이언");
		vo.setTitle("화요일 저녁 6시에 만납시다!");
		//vo.setMeetingDate("to_date('2019-07-01T13:40' yyyy\"년\" mm\"월\" dd\"일\" hh24\"시 \"mi\"분\"')");
		vo.setMeetingDate("2019-07-01T13:40");
		dao.insert(vo);
		ArrayList<MeetingVO> list = dao.listAll();
		for(MeetingVO data : list)
			System.out.println(data);
		/*
		 * System.out.println("화요일이 들어간 글**"); list = dao.search("화요일");
		 */

		for(MeetingVO data : list)
			System.out.println(data);
	}
	
}
