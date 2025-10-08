package com.quiz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.quiz.model.Admin;

@Repository
public class AdminDao {

    @Autowired
    private JdbcTemplate jdbctemp;

    public boolean validateAdmin(String username, String inputPassword) {
        String sql = "SELECT username, password FROM login WHERE username = ?";

        List<Admin> admins = jdbctemp.query(sql, new RowMapper<Admin>() {
            @Override
            public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
                Admin admin = new Admin();
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                return admin;
            }
        }, username);

        if (admins.isEmpty()) {
            return false; 
        }

        Admin admin = admins.get(0);
        return admin.getPassword().equals(inputPassword); 
    }

	
}
