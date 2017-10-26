package com.xwj.rest;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageBrowserServlet
 */
@WebServlet("/ImageBrowser")
public class ImageBrowserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImageBrowserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("imagePath") == null || request.getParameter("imagePath").length() == 0) {
			File file = new File("d:\\images\\");
			String[] arr = file.list();
			request.setAttribute("list", arr);
			request.getRequestDispatcher("/WEB-INF/image_list.jsp").forward(request, response);
		} else {
			DataInputStream dataInputStream = null;
			File file = null;
			try {
				file = new File("d:\\images\\", request.getParameter("imagePath"));
				dataInputStream = new DataInputStream(new FileInputStream(file));

				byte[] barray = new byte[(int) file.length()];
				dataInputStream.readFully(barray);

				response.getOutputStream().write(barray);
			} catch (FileNotFoundException e) {

			} finally {
				if (dataInputStream != null) {
					dataInputStream.close();
				}
			}

		}

	}

}
