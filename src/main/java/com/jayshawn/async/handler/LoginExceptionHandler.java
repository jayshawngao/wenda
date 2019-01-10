package com.jayshawn.async.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jayshawn.async.EventHandler;
import com.jayshawn.async.EventModel;
import com.jayshawn.async.EventType;
import com.jayshawn.util.MailSender;

@Component
public class LoginExceptionHandler implements EventHandler {

	@Autowired
	MailSender mailSender;
	
	@Override
	public void doHandle(EventModel model) {
		model.setExt("from", "jayshawn@qq.com");
		model.setExt("subject", "登录异常");
		mailSender.sendEmail(model);
	}

	@Override
	public List<EventType> getSupportEventTypes() {
		List<EventType> list = new ArrayList<>();
		list.add(EventType.LOGIN);
		return list;
	}

}
