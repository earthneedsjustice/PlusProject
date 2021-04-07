package com.project.plus.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.plus.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class EchoHandler extends TextWebSocketHandler {

	private Map<Integer, WebSocketSession> users = new ConcurrentHashMap<Integer, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		int mNum = getMemberNum(session);
		
		if(mNum != 0) {
			users.put(mNum, session);
			log.info(mNum + " 접속 ");
		} else {
			log.info("접속한 유저가 없습니다");
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		int mNum = getMemberNum(session);
		String msg = message.getPayload();
		log.info("텍스트메시지로 왔네" + msg);

		if(msg != null) {
			String[] str = msg.split(",");
			String notType = str[0];
			// member = 게시글 작성자 , mNum = 지금 접속한 유저 (댓글쓴이)
			int member = Integer.parseInt(str[1]);
			String notMessage = str[2];
			String notUrl = str[3];
			
			// 댓글을 등록한 사람과 접속한 유저가 다른 사람이면 알림 보냄  
			// if조건에 mNum!=member 추가해야함! 
			if(str!=null) {
				WebSocketSession userSession = users.get(mNum);
				TextMessage text = new TextMessage("<a target='_blank' href='"+ notUrl +"'>[<b>" + notType + "알림" + "</b>]<div class=\"content\">" + notMessage + "</div></a>" );
				userSession.sendMessage(text);
				log.info("멤버번호 : " + mNum + ", 헤더로 메시지 보냈음");
				log.info(notType);
			}
		} else {
			log.info("전달받은 메시지 오류");
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("연결 끊김");
	}
	
	private int getMemberNum(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO user = (MemberVO) httpSession.get("user"); 
		int mNum = user.getMemberNum();
		log.info("멤버 번호 : " + user.getMemberNum());
		if(mNum != 0) {
			return mNum;
		} else {
			return 0;
		}
	}

}