package UploadFile;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Bean.Ware;
import DBFunction.WareImpl;
import Tool.DateTool;

/**
 * 
 * �ļ��ϴ� ���岽�裺 1����ô����ļ���Ŀ���� DiskFileItemFactory Ҫ���� 2�� ���� request ��ȡ ��ʵ·��
 * ������ʱ�ļ��洢���� �����ļ��洢 ���������洢λ�ÿɲ�ͬ��Ҳ����ͬ 3���� DiskFileItemFactory ��������һЩ ����
 * 4����ˮƽ��API�ļ��ϴ����� ServletFileUpload upload = new ServletFileUpload(factory);
 * Ŀ���ǵ��� parseRequest��request������ ��� FileItem ����list ��
 * 
 * 5���� FileItem ������ ��ȡ��Ϣ�� ������ �ж� ���ύ��������Ϣ �Ƿ��� ��ͨ�ı���Ϣ �������� 6�� ��һ��. �õ����� �ṩ��
 * item.write( new File(path,filename) ); ֱ��д�������� �ڶ���. �ֶ�����
 * 
 */

@WebServlet("/uploadFile")
public class uploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// �����ļ���Ŀ¼
	private static String PATH_FOLDER = "C:"+File.separator+"image";
	// �����ʱ�ļ���Ŀ¼
	private static String TEMP_FOLDER = "C:"+File.separator+"image"+File.separator+"temp";;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//ServletContext servletCtx = config.getServletContext();
		// ��ʼ��·��
		// �����ļ���Ŀ¼
		//PATH_FOLDER = servletCtx.getRealPath(PATH_FOLDER);
		PATH_FOLDER ="C:"+File.separator+"file";
		// �����ʱ�ļ���Ŀ¼,���xxx.tmp�ļ���Ŀ¼
		//TEMP_FOLDER = servletCtx.getRealPath(TEMP_FOLDER);
		TEMP_FOLDER = "C:"+File.separator+"file"+File.separator+"temp";
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // ���ñ���
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		// ��ô����ļ���Ŀ����
		String type = request.getParameter("type");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		String courseId = request.getParameter("courseId");
		if(courseId==null||type==null) {
			return ;
		}

		if(type.equals("course")) {
			// ���û�����������õĻ����ϴ���� �ļ� ��ռ�� �ܶ��ڴ棬
			// ������ʱ��ŵ� �洢�� , ����洢�ң����Ժ� ���մ洢�ļ� ��Ŀ¼��ͬ
			/**
			 * ԭ�� �����ȴ浽 ��ʱ�洢�ң�Ȼ��������д�� ��ӦĿ¼��Ӳ���ϣ� ������˵ ���ϴ�һ���ļ�ʱ����ʵ���ϴ������ݣ���һ������ .tem
			 * ��ʽ�� Ȼ���ٽ�������д�� ��ӦĿ¼��Ӳ����
			 */
			PATH_FOLDER = "C:"+File.separator+"file"+File.separator+"course"+File.separator+courseId;
			TEMP_FOLDER = "C:"+File.separator+"file"+File.separator+"temp";
			factory.setRepository(new File(TEMP_FOLDER));
			// ���� ����Ĵ�С�����ϴ��ļ������������û���ʱ��ֱ�ӷŵ� ��ʱ�洢��
			factory.setSizeThreshold(1024 * 1024);

			// ��ˮƽ��API�ļ��ϴ�����
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			try {
				// �ύ��������Ϣ�������list����
				// ����ζ�ſ����ϴ�����ļ�
				// ��������֯����
				List<FileItem> list = upload.parseRequest(request);
		
				// ��ȡ�ϴ����ļ�
				FileItem item = getUploadFileItem(list);
				// ��ȡ�ļ���
				String filename = getUploadFileName(item);
				filename = filename.trim();
				// �������ļ���
				String saveName = new Date().getTime() + "$$"+filename;
				// �����ͼƬ�����������·��
				saveName = saveName.trim();
				String wareUrl = "/file/course/"+courseId+"/"+saveName;
				System.out.println("ajaxUpload 97:���Ŀ¼:" + PATH_FOLDER);
				System.out.println("ajaxUpload 98:�ļ���:" + filename);
				System.out.println("ajaxUpload 99:���������·��:" + wareUrl);
				System.out.println("ajaxUpload 98:�ļ��Ƿ����"+new File(PATH_FOLDER, saveName).exists());
				File dir = new File(PATH_FOLDER);
				if(!dir.isDirectory()) {
					dir.mkdirs();
				}
				// ����д��������
				item.write(new File(PATH_FOLDER, saveName)); // �������ṩ��
				Ware ware = new Ware();
				ware.setCourseId(courseId);
				ware.setName(filename);
				ware.setWareUrl(wareUrl);
				ware.setDate(DateTool.getDate());
				boolean b = new WareImpl().addWare(ware);
				if(b) {
					PrintWriter writer = response.getWriter();
					
					writer.print("{");
					writer.print("msg:\"�ļ���С:"+item.getSize()+",�ļ���:"+filename+"\"");
					writer.print(",wareUrl:\"" + wareUrl + "\"");
					writer.print("}");
					
					writer.close();
				}
				
			
			} catch (FileUploadException e) {
				System.out.println("ajaxUpload 112:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("ajaxUpload 114 line:"+e.getMessage());
			}

		}
		
		
	}
	
	private FileItem getUploadFileItem(List<FileItem> list) {
	
		for (FileItem fileItem : list) {
			if(!fileItem.isFormField()) {
				return fileItem;
			}
		}
		return null;
	}
	
	private String getUploadFileName(FileItem item) {
		// ��ȡ·����
		String value = item.getName();
		// ���������һ����б��
		int start = value.lastIndexOf("/");
		// ��ȡ �ϴ��ļ��� �ַ������֣���1�� ȥ����б�ܣ�
		String filename = value.substring(start + 1);
		
		return filename;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
