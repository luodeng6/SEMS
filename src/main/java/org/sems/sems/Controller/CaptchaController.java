package org.sems.sems.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
public class CaptchaController {

    private static final String CHAR_STRING = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
    private static final int WIDTH = 120;
    private static final int HEIGHT = 40;


    @GetMapping("/getCaptchaString")
    public String getCaptchaString(HttpSession session) {
       // 读取 Session 中的验证码
        String code = (String) session.getAttribute("captcha_code");
        if (code == null) {
            return "验证码已失效，请刷新页面";
        }else{
            return code;
        }
    }

    @GetMapping("/captcha")
    public Map<String, Object> getCaptcha(HttpSession session) {
        String code = generateRandomCode(5);
        BufferedImage image = generateCaptchaImage(code);

        // 保存验证码到 Session
        session.setAttribute("captcha_code", code);

        String base64Image = null;
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            ImageIO.write(image, "png", baos);
            byte[] imageBytes = baos.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, Object> result = new HashMap<>();
        result.put("image", "data:image/png;base64," + base64Image);
        return result;
    }

    private String generateRandomCode(int length) {
        Random rand = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(CHAR_STRING.charAt(rand.nextInt(CHAR_STRING.length())));
        }
        return sb.toString();
    }

    private BufferedImage generateCaptchaImage(String code) {
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, WIDTH, HEIGHT);
        g.setFont(new Font("Arial", Font.BOLD, 24));
        Random rand = new Random();

        // 干扰线
        g.setColor(Color.LIGHT_GRAY);
        for (int i = 0; i < 10; i++) {
            int x1 = rand.nextInt(WIDTH);
            int y1 = rand.nextInt(HEIGHT);
            int x2 = rand.nextInt(WIDTH);
            int y2 = rand.nextInt(HEIGHT);
            g.drawLine(x1, y1, x2, y2);
        }

        // 绘制字符
        for (int i = 0; i < code.length(); i++) {
            g.setColor(new Color(rand.nextInt(150), rand.nextInt(150), rand.nextInt(150)));
            g.drawString(String.valueOf(code.charAt(i)), 20 * i + 10, 28);
        }

        g.dispose();
        return image;
    }
}
