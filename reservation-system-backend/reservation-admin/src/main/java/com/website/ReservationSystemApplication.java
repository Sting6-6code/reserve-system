package com.website;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@EnableScheduling
public class ReservationSystemApplication
{
    public static void main(String[] args)
    {
        System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(ReservationSystemApplication.class, args);

        System.out.println("(♥◠‿◠)ﾉﾞ  项目启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                        " _   _                           _\n"+
                        "| \\ | | ___  _ __ ___   __ _  __| |\n"+
                        "|  \\| |/ _ \\| '_ ` _ \\ / _` |/ _` |\n"+
                        "| |\\  | (_) | | | | | | (_| | (_| |\n"+
                        "|_| \\_|\\___/|_| |_| |_|\\__,_|\\__,_|\n");
    }
}

