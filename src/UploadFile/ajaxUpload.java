package UploadFile;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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

@WebServlet("/ajaxUpload")
public class ajaxUpload extends HttpServlet {
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
		PATH_FOLDER ="C:"+File.separator+"image";
		// �����ʱ�ļ���Ŀ¼,���xxx.tmp�ļ���Ŀ¼
		//TEMP_FOLDER = servletCtx.getRealPath(TEMP_FOLDER);
		TEMP_FOLDER = "C:"+File.separator+"image"+File.separator+"temp";
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // ���ñ���
		response.setCharacterEncoding("utf-8");
		System.out.println("update ok");
		response.setContentType("text/html;charset=UTF-8");
		// ��ô����ļ���Ŀ����
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		// ���û�����������õĻ����ϴ���� �ļ� ��ռ�� �ܶ��ڴ棬
		// ������ʱ��ŵ� �洢�� , ����洢�ң����Ժ� ���մ洢�ļ� ��Ŀ¼��ͬ
		/**
		 * ԭ�� �����ȴ浽 ��ʱ�洢�ң�Ȼ��������д�� ��ӦĿ¼��Ӳ���ϣ� ������˵ ���ϴ�һ���ļ�ʱ����ʵ���ϴ������ݣ���һ������ .tem
		 * ��ʽ�� Ȼ���ٽ�������д�� ��ӦĿ¼��Ӳ����
		 */
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
			// �������ļ���
			String saveName = new Date().getTime() + filename.substring(filename.lastIndexOf("."));
			// �����ͼƬ�����������·��
			//String picUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/upload/"+saveName;
			//String picUrl = request.getContextPath()+"/img/"+saveName;
			String picUrl = "/image/"+saveName;
			System.out.println("ajaxUpload 97:���Ŀ¼:" + PATH_FOLDER);
			System.out.println("ajaxUpload 98:�ļ���:" + filename);
			System.out.println("ajaxUpload 99:���������·��:" + picUrl);
	
			System.out.println("ajaxUpload 98:�ļ��Ƿ����"+new File(PATH_FOLDER, saveName).exists());
			File dir = new File(PATH_FOLDER);
			if(!dir.isDirectory()) {
				dir.mkdir();
			}
			// ����д��������
			item.write(new File(PATH_FOLDER, saveName)); // �������ṩ��
			
			PrintWriter writer = response.getWriter();
			
			writer.print("{");
			writer.print("msg:\"�ļ���С:"+item.getSize()+",�ļ���:"+filename+"\"");
			writer.print(",picUrl:\"" + picUrl + "\"");
			writer.print("}");
			
			writer.close();
		
		} catch (FileUploadException e) {
			System.out.println("ajaxUpload 112:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("ajaxUpload 114 line:"+e.getMessage());
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
