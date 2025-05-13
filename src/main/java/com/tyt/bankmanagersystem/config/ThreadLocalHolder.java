package com.tyt.bankmanagersystem.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/7
 */
@Component
public class ThreadLocalHolder {

    private final ThreadLocal<Map<String, Object>> threadLocal = ThreadLocal.withInitial(HashMap::new);

    public void put(String key, Object value) {
        threadLocal.get().put(key, value);
    }

    public Object get(String key) {
        return threadLocal.get().get(key);
    }

    public void clear() {
        threadLocal.remove();
    }
}
