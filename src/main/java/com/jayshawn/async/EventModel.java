package com.jayshawn.async;

import java.util.HashMap;
import java.util.Map;

// 一个事件的实体
public class EventModel {
    // 事件类型
	private EventType type;
    // 触发者
    private int actorId;
    // 触发载体
    private int entityType;
    private int entityId;
    // 触发载体拥有者
    private int entityOwnerId;

    private Map<String, String> exts = new HashMap<String, String>();

    public EventModel() {

    }

    public EventModel setExt(String key, String value) {
        exts.put(key, value);
        return this;
    }

    public EventModel(EventType type) {
        this.type = type;
    }

    public String getExt(String key) {
        return exts.get(key);
    }


    public EventType getType() {
        return type;
    }

    public EventModel setType(EventType type) {
        this.type = type;
        return this;
    }

    public int getActorId() {
        return actorId;
    }

    public EventModel setActorId(int actorId) {
    	System.out.println("com.jayshawn.async.EventModel.setActorId(int):"+actorId);
        this.actorId = actorId;
        return this;
    }

    public int getEntityType() {
        return entityType;
    }

    public EventModel setEntityType(int entityType) {
        this.entityType = entityType;
        return this;
    }

    public int getEntityId() {
        return entityId;
    }

    public EventModel setEntityId(int entityId) {
        this.entityId = entityId;
        return this;
    }

    public int getEntityOwnerId() {
        return entityOwnerId;
    }

    public EventModel setEntityOwnerId(int entityOwnerId) {
        this.entityOwnerId = entityOwnerId;
        return this;
    }

    public Map<String, String> getExts() {
        return exts;
    }

    public EventModel setExts(Map<String, String> exts) {
        this.exts = exts;
        return this;
    }

	@Override
	public String toString() {
		return "EventModel [type=" + type + ", actorId=" + actorId + ", entityType=" + entityType + ", entityId="
				+ entityId + ", entityOwnerId=" + entityOwnerId + "]";
	}
    
    
}
