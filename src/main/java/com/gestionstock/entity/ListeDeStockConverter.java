package com.gestionstock.entity;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

@Converter
public class ListeDeStockConverter implements AttributeConverter<ListeDeStock, String> {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public String convertToDatabaseColumn(ListeDeStock attribute) {
        try {
            return objectMapper.writeValueAsString(attribute);
        } catch (Exception e) {
            throw new RuntimeException("Error converting ListeDeStock to JSON", e);
        }
    }

    @Override
    public ListeDeStock convertToEntityAttribute(String dbData) {
        try {
            if (dbData == null || dbData.isEmpty()) {
                return new ListeDeStock();
            }
            return objectMapper.readValue(dbData, new TypeReference<ListeDeStock>() {});
        } catch (Exception e) {
            throw new RuntimeException("Error converting JSON to ListeDeStock", e);
        }
    }
} 