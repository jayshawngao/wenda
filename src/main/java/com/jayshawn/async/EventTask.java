package com.jayshawn.async;

public class EventTask implements Runnable {

	private EventHandler handler;
	private EventModel model;
	
	public EventTask(EventHandler handler, EventModel model) {
		this.handler = handler;
		this.model = model;
	}
	
	@Override
	public void run() {
		handler.doHandle(model);
	}

}
  