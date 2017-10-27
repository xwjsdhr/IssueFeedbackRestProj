package com.xwj.rest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.google.gson.Gson;
import com.xwj.entity.Issue;
import com.xwj.params.MyError;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class DeptUsersServlet
 */
@WebServlet("/Export")
public class ExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson gson;
	

	public ExportServlet() {
		super();
		businessService = BusinessServiceImpl.newInstance();
		gson = new Gson();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String idStr = request.getParameter("arr");
		if (idStr != null && idStr.trim().length() > 0) {
			String[] idArr = idStr.split(",");
			response.setContentType("application/json; charset=UTF-8");
			List<Integer> list = new ArrayList<>();
			for (int i = 0; i < idArr.length; i++) {
				list.add(Integer.parseInt(idArr[i]));
			}
			List<Issue> issues = businessService.getIssuesInRange(list);
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet issueListSheet = workbook.createSheet("�����б�");
			XSSFRow title = issueListSheet.createRow(0);
			
			XSSFCell titleCell = title.createCell(0);
			titleCell.setCellValue("����");
			XSSFCell contentCell = title.createCell(1);
			contentCell.setCellValue("����");
			XSSFCell submitTimeCell = title.createCell(2);
			submitTimeCell.setCellValue("�ύʱ��");
			XSSFCell lastUpdateCell = title.createCell(3);
			lastUpdateCell.setCellValue("���¸���ʱ��");
			XSSFCell statusCell = title.createCell(4);
			statusCell.setCellValue("״̬");

			for (int i = 1; i <= issues.size(); i++) {
				XSSFRow createRow = issueListSheet.createRow(i);
				XSSFCell titleC = createRow.createCell(0);
				titleC.setCellValue(issues.get(i - 1).getTitle());
				XSSFCell content = createRow.createCell(1);
				content.setCellValue(issues.get(i - 1).getContent());
				XSSFCell submitTime = createRow.createCell(2);
				submitTime.setCellValue(issues.get(i - 1).getSubmitTime());
				XSSFCell lastUpdateTime = createRow.createCell(3);
				lastUpdateTime.setCellValue(issues.get(i - 1).getLastUpdateTime());
				XSSFCell statusC = createRow.createCell(4);
				statusC.setCellValue(issues.get(i - 1).getStatus().getStatusName());
			}
			
			FileOutputStream outputStream = new FileOutputStream("d:\\download.xlsx");
			workbook.write(outputStream);
			workbook.close();

			MyError myError = new MyError("cheng gong", -1, null);
			response.getWriter().append(gson.toJson(myError));
		}else {
			MyError myError = new MyError("��ѡ������", 1, null);
			response.getWriter().append(gson.toJson(myError));
		}
	}
}
