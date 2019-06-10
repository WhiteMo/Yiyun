package com.xzy.socket;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.xzy.vo.Message;

@ServerEndpoint("/chatSocket")
public class ChatSocket {
	//�洢��ǰsocket����
	private static Set<ChatSocket> sockets = new HashSet<ChatSocket>();
	//�û���
	private static List<String> names = new ArrayList<String>();
	private Session session;
	private String username;
	private Gson gson = new Gson();

	// ����
	@OnOpen
	public void open(Session session) {
		this.session = session;
		sockets.add(this);
		String queryString = session.getQueryString();
		this.username = queryString.substring(queryString.indexOf("=") + 1);
		names.add(this.username);

		Message message = new Message();
		message.setAlert(this.username + "���������ң���");
		message.setNames(names);
		broadcast(sockets, gson.toJson(message));
	}
	//�˳�
	@OnClose
	public void close(Session session) {
		sockets.remove(this);
		names.remove(this.username);

		Message message = new Message();
		message.setAlert(this.username + "�˳������ң���");
		message.setNames(names);

		broadcast(sockets, gson.toJson(message));
	}
	//����
	@OnMessage
	public  void receive(Session  session,String msg ){
		
		Message  message=new Message();
		message.setSendMsg(msg);
		try {
			this.username=URLDecoder.decode(this.username, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("ChatSocket 67 line:"+e.getMessage());
		}
		message.setFrom(this.username);
	
		message.setDate(new Date().toLocaleString());
		
		broadcast(sockets, gson.toJson(message));
	}
		
	public void broadcast(Set<ChatSocket> ss, String msg) {

		for (Iterator iterator = ss.iterator(); iterator.hasNext();) {
			ChatSocket chatSocket = (ChatSocket) iterator.next();
			try {
				chatSocket.session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
