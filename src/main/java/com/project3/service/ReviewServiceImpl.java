package com.project3.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusMemberDAO;
import com.project3.dao.IdusProductDAO;
import com.project3.dao.IdusReviewDAO;
import com.project3.vo.IdusProductVO;
import com.project3.vo.IdusReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements BoardService {
	@Autowired
	private IdusReviewDAO reviewDAO;

	@Autowired
	private IdusMemberDAO memberDAO;
	
	@Autowired
	private IdusProductDAO productDAO;

	public Object getList() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getResultWrite(Object vo) {
		IdusReviewVO rvo = (IdusReviewVO) vo;
		String val = "";
		if (rvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			rvo.setRfile(rvo.getFile1().getOriginalFilename());
			rvo.setRsfile(uuid + "_" + rvo.getFile1().getOriginalFilename());

			boolean result = reviewDAO.getInsert(rvo);
			IdusProductVO pvo = reviewDAO.getAvg(rvo.getPid());	//�ش� pid, product_avg ��������
			productDAO.getInsertAvg(pvo);	//�ش��ϴ� pid, product_avg���� ������Ʈ
			if (result) {
				try {
					File file = new File(rvo.getSavepath() + rvo.getRsfile());
					rvo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				val = "����� ��ǰ�� �ϳ��� ���� �� �ֽ��ϴ�.";
				System.out.println("���伭��");
			}
		} else {
		}
		return val;
	}

	@Override
	public Object getContent(String id) {
		ModelAndView mv = new ModelAndView();

		IdusReviewVO vo = reviewDAO.getContent(id);

		mv.addObject("vo", vo);
		mv.setViewName("/admin/review/review_mng_content");
		mv.addObject("psfile", memberDAO.getPsfile("admin"));
		return mv;
	}

	public ModelAndView getUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		IdusReviewVO vo = reviewDAO.getContent(id);
		mv.addObject("vo", vo);
		mv.setViewName("mypage/review_update");
		return mv;
	}

	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		// ����üũ ��:���ο� ���ϼ���/��:�������� ����
		IdusReviewVO rvo = (IdusReviewVO) vo;
		System.out.println(rvo.getFile1());
		boolean result = false;
		if (rvo.getFile1().getSize() != 0) {
			// ���ο� ���� ����
			// bfile, bsfile --> bvo�߰�
			UUID uuid = UUID.randomUUID();
			rvo.setRfile(rvo.getFile1().getOriginalFilename());
			rvo.setRsfile(uuid + "_" + rvo.getFile1().getOriginalFilename());
		}

		// DB����
		result = reviewDAO.getUpdate(rvo);

		// upload ������ ������ ����
		// ���� ����--> upload ������ ����(������ġ)
		if (result) {
			File file = new File(rvo.getSavepath() + rvo.getRsfile());
			try {
				rvo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}

			mv.setViewName("redirect:/my_review.do");
		} else {
			System.out.println("error");
		}

		return mv;
	}

	@Override
	public Object getList(String rpage, String param) {
		ModelAndView mv = new ModelAndView();

		int start = 0;
		int end = 0;
		int pageSize = 10; // �� �������� ��µǴ� row
		int pageCount = 1; // ��ü ������ �� : ��ü row / �� �������� ��µǴ� row
		int dbCount = reviewDAO.getCount(); // DB���� �� ��ü�ο�� ���
		int reqPage = 1; // ��û ������

		// 2-2. ��ü ������ �� ���ϱ�
		if ((dbCount % pageSize) == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = (dbCount / pageSize) + 1;
		}

		// 2-3. start, end �� ���ϱ�
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage * pageSize;
		} else {
			start = reqPage;
			end = pageSize;
		}

		// 3. DAO ��ü ����
		ArrayList<IdusReviewVO> list = reviewDAO.getList(start, end);

		// board_list.jsp ���Ϸ� ������ ����
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		mv.addObject("psfile", memberDAO.getPsfile("admin"));

		mv.setViewName("/admin/review/review_mng_list");
		return mv;
	}
	
	@Override
	public int getResultDelete(String id) {
		return 0;
	}

	public int getResultDelete(String[] dellist) {
		int count = 0;
		if (dellist[0].equals("all")) {
			count = reviewDAO.getDeleteAll();
		} else {
			count = reviewDAO.getDeleteSelect(dellist);
		}
		return count;
	}

	public Object reviewList(String rpage, String param, String uemail) {
		ModelAndView mv = new ModelAndView();

		int start = 0;
		int end = 0;
		int pageSize = 10; // �� �������� ��µǴ� row
		int pageCount = 1; // ��ü ������ �� : ��ü row / �� �������� ��µǴ� row
		int dbCount = reviewDAO.getCount(); // DB���� �� ��ü�ο�� ���
		int reqPage = 1; // ��û ������

		// 2-2. ��ü ������ �� ���ϱ�
		if ((dbCount % pageSize) == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = (dbCount / pageSize) + 1;
		}

		// 2-3. start, end �� ���ϱ�
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage * pageSize;
		} else {
			start = reqPage;
			end = pageSize;
		}

		// 3. DAO ��ü ����
		ArrayList<IdusReviewVO> list = reviewDAO.reviewList(start, end, uemail);
		String psfile = memberDAO.getPsfile(uemail);

		// board_list.jsp ���Ϸ� ������ ����
		mv.addObject("psfile", psfile);
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);

		mv.setViewName("/mypage/my_review");
		return mv;
	}

	public ModelAndView getreviewDelete(String rid) {
		ModelAndView mv = new ModelAndView();
		int result = reviewDAO.getreviewDelete(rid);
		if (result != 0) {
			mv.setViewName("redirect:/my_review.do");
		} else {
			System.out.println("error");
		}
		return mv;
	}

}
