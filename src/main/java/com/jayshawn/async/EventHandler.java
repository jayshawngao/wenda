package com.jayshawn.async;

import java.util.List;


// 处理事件
public interface EventHandler {
    void doHandle(EventModel model);
    // 关注哪些EventType
    List<EventType> getSupportEventTypes();
}
