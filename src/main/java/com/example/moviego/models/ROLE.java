package com.example.moviego.models;

import org.springframework.security.core.GrantedAuthority;

public enum ROLE implements GrantedAuthority {
    ROLE_USER, ROLE_ADMIN;
    @Override
    public String getAuthority() {
        return name();
    }
}