#!/bin/bash
# 密码重置脚本
# 用于生成 BCrypt 密码哈希并更新数据库

# 配置
DB_HOST="127.0.0.1"
DB_PORT="3306"
DB_USER="root"
DB_PASS="NiubiSPA"
DB_NAME="reservation-system"
USERNAME="${1:-admin}"
NEW_PASSWORD="${2:-admin123}"

echo "=========================================="
echo "密码重置工具"
echo "=========================================="
echo "用户名: $USERNAME"
echo "新密码: $NEW_PASSWORD"
echo ""

# 检查是否安装了 Java
if ! command -v java &> /dev/null; then
    echo "错误: 未找到 Java，请先安装 Java"
    exit 1
fi

# 检查是否在项目目录中
if [ ! -f "pom.xml" ]; then
    echo "错误: 请在项目根目录运行此脚本"
    exit 1
fi

echo "正在生成 BCrypt 密码哈希..."
echo ""

# 使用 Maven 编译并运行 Java 工具
# 注意：这需要项目依赖可用
mvn -q exec:java -Dexec.mainClass="ResetPasswordTool" -Dexec.args="$NEW_PASSWORD" 2>/dev/null

if [ $? -ne 0 ]; then
    echo ""
    echo "使用备用方法：通过 Spring Boot 应用生成密码哈希"
    echo ""
    echo "请手动执行以下步骤："
    echo "1. 创建一个临时的 Spring Boot 测试类"
    echo "2. 或者使用以下 SQL（需要先手动生成 BCrypt 哈希）"
    echo ""
    echo "生成 BCrypt 哈希的方法："
    echo "  在 Java 代码中执行："
    echo "  BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();"
    echo "  String hash = encoder.encode(\"$NEW_PASSWORD\");"
    echo "  System.out.println(hash);"
    echo ""
    echo "然后执行 SQL："
    echo "  UPDATE sys_user SET password = '<生成的哈希>' WHERE user_name = '$USERNAME';"
    exit 1
fi

echo ""
read -p "是否立即更新数据库密码？(y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "请输入上面生成的 BCrypt 哈希值："
    read -r BCRYPT_HASH
    
    if [ -z "$BCRYPT_HASH" ]; then
        echo "错误: 哈希值不能为空"
        exit 1
    fi
    
    echo ""
    echo "正在更新数据库..."
    
    mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
UPDATE sys_user 
SET password = '$BCRYPT_HASH' 
WHERE user_name = '$USERNAME';

SELECT 
    user_name,
    CASE 
        WHEN password = '$BCRYPT_HASH' THEN '✓ 密码已更新'
        ELSE '✗ 密码更新失败'
    END as result,
    LEFT(password, 20) as password_preview
FROM sys_user 
WHERE user_name = '$USERNAME';
EOF

    if [ $? -eq 0 ]; then
        echo ""
        echo "✓ 密码重置成功！"
        echo "现在可以使用新密码 '$NEW_PASSWORD' 登录了。"
    else
        echo ""
        echo "✗ 密码重置失败，请检查数据库连接配置"
    fi
else
    echo ""
    echo "请手动执行 SQL 来更新密码"
fi
