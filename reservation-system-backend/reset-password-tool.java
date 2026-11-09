import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 密码重置工具
 * 用于生成 BCrypt 加密的密码哈希值
 * 
 * 使用方法：
 * 1. 编译：javac -cp ".:path/to/spring-security-crypto.jar" reset-password-tool.java
 * 2. 运行：java -cp ".:path/to/spring-security-crypto.jar" ResetPasswordTool <新密码>
 * 
 * 或者直接在 IDE 中运行 main 方法
 */
public class ResetPasswordTool {
    
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("使用方法: java ResetPasswordTool <新密码>");
            System.out.println("示例: java ResetPasswordTool admin123");
            System.exit(1);
        }
        
        String newPassword = args[0];
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        
        System.out.println("==========================================");
        System.out.println("密码重置工具");
        System.out.println("==========================================");
        System.out.println("原始密码: " + newPassword);
        System.out.println("BCrypt 哈希: " + encodedPassword);
        System.out.println("==========================================");
        System.out.println();
        System.out.println("请执行以下 SQL 来重置 admin 用户的密码：");
        System.out.println();
        System.out.println("UPDATE sys_user SET password = '" + encodedPassword + "' WHERE user_name = 'admin';");
        System.out.println();
        System.out.println("或者重置其他用户：");
        System.out.println("UPDATE sys_user SET password = '" + encodedPassword + "' WHERE user_name = '<用户名>';");
        System.out.println();
        System.out.println("验证密码（可选）：");
        System.out.println("SELECT user_name, LEFT(password, 20) as password_preview FROM sys_user WHERE user_name = 'admin';");
    }
}
