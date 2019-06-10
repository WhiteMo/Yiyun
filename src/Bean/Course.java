package Bean;
import DBFunction.SCImpl;
import Tool.StringTool;
public class Course {
    
    /**
     * �γ�id
     */
    public String id;
    
    /**
     * �γ̽�ʦ
     */
    public String teacherId;
    
    /**
     * �γ�����
     */
    public String name;
    
    /**
     * �ڿν�ʦ
     */
    public String teacherName;
    
    /**
     * �γ�ͼƬ
     */
    public String imgUrl;
    
    /**
     * �γ̿����ѧ
     */
    public String college;
    /**
     * ��ת��ַ
     */
    public String targetUrl;
    
    /**
     * �γ̼��
     */
    public String shortContent;
    
    
    /**
     * �γ̿μ���ַ
     */
    public String wareUrl;
    
    /**
     * �γ̲���״̬
     * 0��ʾ�Ѿ��������
     * 1��ʾ����ֱ��
     * 2��ʾ��Ҫֱ��
     */
    public String status;
    
    /**
     * �����γ��Ƿ�֧��Ipv6
     * 0��ʾ֧��
     * 1��ʾ��֧��
     */
    public String isIpv6;
    
    /**
     * �Ƿ���⿪��
     * 0��ʾ�����⿪��
     * 1��ʾ���⿪��
     */
    public String isOpen;
    
    public int getCourse() {
        User[] preStudents = new SCImpl().getPreStudentsByCourseId(id);
        return preStudents.length;
    }
    
    public String getIsOpen() {
        return isOpen;
    }
    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }
    public String getIsIpv6() {
        return isIpv6;
    }
    public void setIsIpv6(String isIpv6) {
        this.isIpv6 = isIpv6;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getTeacherId() {
        return teacherId;
    }
    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
    public String getTeacherName() {
        return teacherName;
    }
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    public String getTargetUrl() {
        return targetUrl;
    }
    public void setTargetUrl(String targetUrl) {
        this.targetUrl = targetUrl;
    }
    
    public String getImgUrl() {
        return imgUrl;
    }
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
    public String getCollege() {
        return college;
    }
    public void setCollege(String college) {
        this.college = college;
    }
    public String getShortContent() {
        return shortContent;
    }
    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }
    public String getWareUrl() {
        return wareUrl;
    }
    public void setWareUrl(String wareUrl) {
        this.wareUrl = wareUrl;
    }
    @Override
    public String toString() {
        return "Course [id=" + id + ", name=" + name + ", teacherName=" + teacherName + ", imgUrl=" + imgUrl
                + ", college=" + college + ", targetUrl=" + targetUrl + ", shortContent=" + shortContent + ", wareUrl="
                + wareUrl + ", status=" + status + "]";
    }
    
    public String getCode() {
        return StringTool.idToCode(id);
    }
    
    
    
    
}