package com.gestionstock.util;

import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;

public class JsonUtil {
    private static final Jsonb jsonb = JsonbBuilder.create();
    
    public static String toJson(Object object) {
        try {
            return jsonb.toJson(object);
        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de la conversion en JSON", e);
        }
    }
    
    public static <T> T fromJson(String json, Class<T> type) {
        try {
            return jsonb.fromJson(json, type);
        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de la conversion depuis JSON", e);
        }
    }
} 