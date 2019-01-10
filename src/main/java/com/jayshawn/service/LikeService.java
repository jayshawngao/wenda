package com.jayshawn.service;

import com.jayshawn.util.JedisAdapter;
import com.jayshawn.util.RedisKeyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LikeService {
    @Autowired
    JedisAdapter jedisAdapter;


    // 当前实体有多少人喜欢
    public long getLikeCount(int entityType, int entityId) {
        String likeKey = RedisKeyUtil.getLikeKey(entityType, entityId);
        return jedisAdapter.scard(likeKey);
    }

    // 某个用户对某个实体的喜欢和不喜欢状态 喜欢1 不喜欢-1 否则0
    public int getLikeStatus(int userId, int entityType, int entityId) {
        String likeKey = RedisKeyUtil.getLikeKey(entityType, entityId);
        if (jedisAdapter.sismember(likeKey, String.valueOf(userId))) {
            return 1;
        }
        String disLikeKey = RedisKeyUtil.getDisLikeKey(entityType, entityId);
        return jedisAdapter.sismember(disLikeKey, String.valueOf(userId)) ? -1 : 0;
    }

    // 点赞操作
    // 因为set会去重，所以每个用户只能喜欢或者不喜欢一次，喜欢set和不喜欢set中存放的是用户id
    public long like(int userId, int entityType, int entityId) {
        // 加入喜欢set
    	String likeKey = RedisKeyUtil.getLikeKey(entityType, entityId);
        jedisAdapter.sadd(likeKey, String.valueOf(userId));

        // 并将用户id从不喜欢set中删除
        String disLikeKey = RedisKeyUtil.getDisLikeKey(entityType, entityId);
        jedisAdapter.srem(disLikeKey, String.valueOf(userId));

        return jedisAdapter.scard(likeKey);
    }

    // 踩操作
    public long disLike(int userId, int entityType, int entityId) {
        // 加入不喜欢set
    	String disLikeKey = RedisKeyUtil.getDisLikeKey(entityType, entityId);
        jedisAdapter.sadd(disLikeKey, String.valueOf(userId));
        // 并将用户id从喜欢set中删除
        String likeKey = RedisKeyUtil.getLikeKey(entityType, entityId);
        jedisAdapter.srem(likeKey, String.valueOf(userId));

        return jedisAdapter.scard(likeKey);
    }
}
