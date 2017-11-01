package com.xwj.rest;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class CommentImageUploadServlet
 */
@WebServlet("/CommentImageUpload")
public class CommentImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentImageUploadServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String strCKEditorFuncNum = request.getParameter("CKEditorFuncNum");
		System.out.println(isMultipart);
		if (isMultipart) {
			DiskFileItemFactory factory = new DiskFileItemFactory();

			File repository = new File("D:\\image\\");
			factory.setRepository(repository);

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(request.getContentLengthLong());

			// Parse the request

			try {
				FileItemIterator itemIterator = upload.getItemIterator(request);
				while (itemIterator.hasNext()) {

					FileItemStream stream = itemIterator.next();
					if (!stream.isFormField()) {
						System.out.println("not");
						InputStream openStream = stream.openStream();
						String fileEndWith = stream.getName().substring(stream.getName().lastIndexOf("."),
								stream.getName().length());

						String fnX = new Date().getTime() + fileEndWith;

						File f = new File("d:\\images\\" + fnX);

						FileOutputStream fileOutputStream = new FileOutputStream(f);
						BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
						byte buffer[] = new byte[4096];
						int len = 0;
						while ((len = openStream.read(buffer)) > 0) {
							bufferedOutputStream.write(buffer,0,len);
						}

						bufferedOutputStream.flush();
						

						response.getWriter()
								.append("<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction("
										+ strCKEditorFuncNum + ",'/IssueFeedbackProject/ImageBrowser?imagePath=" + fnX
										+ "','" + "');</script>");
					}

				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
