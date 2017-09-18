package com.xwj.rest;

import java.awt.Robot;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.google.gson.Gson;
import com.xwj.entity.Issue;
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
		businessService = new BusinessService();
		gson = new Gson();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String idStr = request.getParameter("arr");
		String[] idArr = idStr.split(",");
		List<Integer> list = new ArrayList<>();
		for (int i = 0; i < idArr.length; i++) {
			list.add(Integer.parseInt(idArr[i]));
		}
		List<Issue> issues = businessService.getIssuesInRange(list);
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet issueListSheet = workbook.createSheet("问题列表");
		for (int i = 0; i < issues.size(); i++) {
			XSSFRow createRow = issueListSheet.createRow(i);
			Cell cell = createRow.createCell(0);
			if (i == 0) {
				cell.setCellValue("issue");
			} else {
				cell.setCellValue(issues.get(i).getTitle());
			}
		}
		FileOutputStream outputStream = new FileOutputStream("/files/download_issues.xlsx");
		workbook.write(outputStream);
		workbook.close();

		System.out.println(issues);
	}
}
