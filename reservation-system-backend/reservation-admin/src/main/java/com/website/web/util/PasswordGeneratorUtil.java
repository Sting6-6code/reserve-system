package com.website.web.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 密码生成工具类
 * 用于生成 BCrypt 加密的密码哈希值
 * 
 * 使用方法：
 * 1. 在 IDE 中直接运行 main 方法
 * 2. 或者通过命令行：java -cp ... PasswordGeneratorUtil <新密码>
 */
public class PasswordGeneratorUtil {
    
    public static void main(String[] args) {
        // 默认密码，可以通过命令行参数指定
        String newPassword = args.length > 0 ? args[0] : "admin123";
        String username = args.length > 1 ? args[1] : "admin";
        
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        
        System.out.println("==========================================");
        System.out.println("密码生成工具");
        System.out.println("==========================================");
        System.out.println("用户名: " + username);
        System.out.println("新密码: " + newPassword);
        System.out.println("BCrypt 哈希: " + encodedPassword);
        System.out.println("==========================================");
        System.out.println();
        System.out.println("请执行以下 SQL 来重置密码：");
        System.out.println();
        System.out.println("USE reservation-system;");
        System.out.println("UPDATE sys_user SET password = '" + encodedPassword + "' WHERE user_name = '" + username + "';");
        System.out.println();
        System.out.println("验证更新：");
        System.out.println("SELECT user_name, LEFT(password, 20) as password_preview FROM sys_user WHERE user_name = '" + username + "';");
        System.out.println();
        System.out.println("清除登录锁定（如果需要）：");
        System.out.println("redis-cli -h localhost -p 6379 -a liuhuoniu@123 -n 0 DEL pwd_err_cnt:" + username);
        System.out.println();
        System.out.println("==========================================");
    }
    
    /**
     * 生成指定密码的 BCrypt 哈希
     * @param password 原始密码
     * @return BCrypt 哈希值
     */
    public static String generateHash(String password) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.encode(password);
    }
    
    /**
     * 验证密码是否匹配
     * @param rawPassword 原始密码
     * @param encodedPassword BCrypt 哈希值
     * @return 是否匹配
     */
    public static boolean verifyPassword(String rawPassword, String encodedPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }
}
