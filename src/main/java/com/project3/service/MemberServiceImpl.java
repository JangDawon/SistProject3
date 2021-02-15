package com.project3.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusMemberDAO;
import com.project3.dao.IdusProductDAO;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusOrderVO;
import com.project3.vo.IdusProductVO;
import com.project3.vo.IdusSessionVO;

@Service("memberService")
public class MemberServiceImpl {
	@Autowired
	private IdusMemberDAO memberDAO;
	@Autowired
	private IdusProductDAO productDAO;
	/**
	 * ȸ������ ���
	 */
	public ModelAndView getResultJoin(IdusMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean join_result = memberDAO.getInsert(vo);

		if (join_result) {
			mv.addObject("vo", vo);
			mv.setViewName("/join/join_success");
		}

		return mv;
	}

	 /**
	    * ������ : ȸ�� ��ü ����Ʈ
	    */
	   public ModelAndView getList(String rpage) {
	      ModelAndView mv = new ModelAndView();
	      
	      int start = 0;
	      int end = 0;
	      int pageSize = 10; //�� �������� ��µǴ� row
	      int pageCount = 1; //��ü ������ �� : ��ü row / �� �������� ��µǴ� row
	      int dbCount = memberDAO.getCount(); //DB���� �� ��ü�ο�� ���
	      int reqPage = 1; //��û ������
	      
	      //2-2. ��ü ������ �� ���ϱ�
	      if((dbCount%pageSize) == 0){
	         pageCount = dbCount/pageSize;
	      }else{
	         pageCount = (dbCount/pageSize)+1;
	      }
	      
	      //2-3. start, end �� ���ϱ�
	      if(rpage != null){
	         reqPage = Integer.parseInt(rpage);
	         start = (reqPage - 1) * pageSize + 1;
	         end = reqPage*pageSize;
	      }else{
	         start = reqPage;
	         end = pageSize;
	      }
	      
	      //3. DAO ��ü ����
	      ArrayList<IdusMemberVO> list = memberDAO.getList(start, end);
	      
	      //board_list.jsp ���Ϸ� ������ ����
	      mv.addObject("list", list);
	      mv.addObject("dbCount", dbCount);
	      mv.addObject("pageSize", pageSize);
	      mv.addObject("reqPage", reqPage);
	      mv.addObject("psfile", memberDAO.getPsfile("admin"));
	      
	      mv.setViewName("/admin/user/user_mng_list");
	      
	      return mv;
	   }

 
   /**
    * �α��� ���!
    */
   public ModelAndView getResultLogin(IdusMemberVO vo, HttpSession session) {
      ModelAndView mv = new ModelAndView();
      IdusSessionVO svo = memberDAO.getLogin(vo);
      
      if(svo != null) {
         session.setAttribute("svo", svo);
         mv.addObject("vo", vo);
         mv.setViewName("redirect:/index.do");          
      }else {
         mv.addObject("result", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���.");
         mv.setViewName("/login/login");
      }
      
      return mv;
   }
   
  
   
   public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		IdusSessionVO svo = (IdusSessionVO) vo;
		boolean result = false;
		if (svo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			svo.setPfile(svo.getFile1().getOriginalFilename());
			svo.setPsfile(uuid + "_" + svo.getFile1().getOriginalFilename());
		}

		result = memberDAO.getUpdate(svo);

		if (result) {
			File file = new File(svo.getSavepath() + svo.getPsfile());
			try {
				svo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// mv.addObject("vo",svo);
			mv.setViewName("redirect:/my_info.do");
		} else {

		}
		return mv;
	}

	/**
	 * ȸ�� ����
	 */
	public int getResultDelete(String[] userlist) {
		int count = 0;

		if (userlist[0].equals("all")) {
			count = memberDAO.getResultDelete();
		} else {
			count = memberDAO.getResultDelete(userlist);
		}

		return count;
	}

	/**
	 * �̸��� �ߺ� üũ
	 */
	public int getResultEmailCheck(String email) {
		return memberDAO.getEmailCheck(email);
	}

	/**
	 * ���̵�/��й�ȣ ã��
	 */
	public ModelAndView getResultLoginCheck(String hp) {
		ModelAndView mv = new ModelAndView();
		ArrayList<IdusMemberVO> list = memberDAO.getLoginCheck(hp);
		mv.addObject("list", list);
		mv.setViewName("/login/login_check_result");
		return mv;
	}

	/**
	 * ������ : ȸ�� ����
	 */
	public ModelAndView getUserContent(String uid) {
		ModelAndView mv = new ModelAndView();

		IdusMemberVO vo = memberDAO.getUserContent(uid);

		mv.addObject("vo", vo);
		mv.addObject("psfile", memberDAO.getPsfile("admin"));
		mv.setViewName("/admin/user/user_mng_content");

		return mv;
	}

	public ModelAndView getContent(String email) {
		ModelAndView mv = new ModelAndView();
		IdusMemberVO vo = memberDAO.getContent(email);
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/my_info");
		return mv;
	}
	
	public ModelAndView getProfile(String email) {
		ModelAndView mv = new ModelAndView();
		IdusMemberVO vo = memberDAO.getContent(email);
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/mypage_aside");
		return mv;
	}
	public ModelAndView getResultDelete(String uemail) {
		ModelAndView mv = new ModelAndView();
		boolean result = memberDAO.getDelete(uemail);

		if (result) {
			mv.setViewName("login/login");
		} else {
			mv.setViewName("errorPage");
		}

		return mv;

	}
	public Object getorderList(String rpage, String param,String uemail) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 5; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ �� : ��ü row / �� �������� ��µǴ� row
		int dbCount = memberDAO.getorderCount(); //DB���� �� ��ü�ο�� ���
		int reqPage = 1; //��û ������
		
		//2-2. ��ü ������ �� ���ϱ�
		if((dbCount%pageSize) == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = (dbCount/pageSize)+1;
		}
		
		//2-3. start, end �� ���ϱ�
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage*pageSize;
		}else{
			start = reqPage;
			end = pageSize;
		}
		
		//3. DAO ��ü ����
		ArrayList<IdusOrderVO> list = memberDAO.getorderList(start, end,uemail);
		String psfile = memberDAO.getPsfile(uemail);
		//board_list.jsp ���Ϸ� ������ ����
		mv.addObject("psfile",psfile);
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		
		mv.setViewName("/mypage/my_order");
		return mv;
	}
	public Object getcancelList(String rpage, String param,String uemail) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 5; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ �� : ��ü row / �� �������� ��µǴ� row
		int dbCount = memberDAO.getorderCount(); //DB���� �� ��ü�ο�� ���
		int reqPage = 1; //��û ������
		
		//2-2. ��ü ������ �� ���ϱ�
		if((dbCount%pageSize) == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = (dbCount/pageSize)+1;
		}
		
		//2-3. start, end �� ���ϱ�
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage*pageSize;
		}else{
			start = reqPage;
			end = pageSize;
		}
		
		//3. DAO ��ü ����
		ArrayList<IdusOrderVO> list = memberDAO.getcancelList(start, end,uemail);
		String psfile = memberDAO.getPsfile(uemail);
		//board_list.jsp ���Ϸ� ������ ����
		mv.addObject("psfile", psfile);
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		
		mv.setViewName("/mypage/my_cancel");
		return mv;
	}
	public ModelAndView getProductContent(String pid,String oid) {
		ModelAndView mv = new ModelAndView();
		IdusProductVO vo = productDAO.getContent(pid);
		mv.addObject("oid", oid);
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/review_write");
		return mv;
	}
	public ModelAndView getProductContent2(String pid,String oid,String rid) {
		ModelAndView mv = new ModelAndView();
		IdusProductVO vo = productDAO.getContent(pid);
		mv.addObject("rid", rid);
		mv.addObject("oid", oid);
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/review_update");
		return mv;
	}
	public ModelAndView getorderCancel(String oid) {
		ModelAndView mv = new ModelAndView();
		int result = memberDAO.getorderCancel(oid);
		if(result != 0) {
			mv.setViewName("redirect:/my_order.do");
		}else {
			System.out.println("error");
		}
		return mv;
	}
	public ModelAndView getorderDelete(String oid) {
		ModelAndView mv = new ModelAndView();
		int result = memberDAO.getorderDelete(oid);
		if(result != 0) {
			mv.setViewName("redirect:/my_cancel.do");
		}else {
			System.out.println("error");
		}
		return mv;
	}
	public ModelAndView getbookmarkList(String uemail) {
		ModelAndView mv = new ModelAndView();
		String psfile = memberDAO.getPsfile(uemail);
		ArrayList<IdusProductVO> list = memberDAO.getbookmarkList();
		mv.addObject("psfile", psfile);
		mv.addObject("list",list);
		mv.setViewName("mypage/my_bookmark_item");
		return mv;
	}

}
