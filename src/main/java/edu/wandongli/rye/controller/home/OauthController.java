package edu.wandongli.rye.controller.home;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.wandongli.rye.enums.WayEnum;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.pojo.UserAuth;
import edu.wandongli.rye.service.UserAuthService;
import edu.wandongli.rye.service.UserService;
import edu.wandongli.rye.util.HttpClientUtil;
import edu.wandongli.rye.util.ResultObject;
import edu.wandongli.rye.util.ValidatorUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

@Slf4j
@RequestMapping("/oauth")
@RestController
public class OauthController {

    private UserService userService;
    private UserAuthService userAuthService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setUserAuthService(UserAuthService userAuthService) {
        this.userAuthService = userAuthService;
    }

    @GetMapping("/gitHub")
    public ModelAndView gitHub(ModelAndView modelAndView, HttpServletResponse response,
                               HttpSession session,
                               @RequestParam(value = "code", required = false) String code) throws IOException {
        //先得到code
        String redirectUrl = "http://d2sdiv.natappfree.cc/oauth/gitHub";
        if (StringUtils.isBlank(code)) {
            String codeUrl = "https://github.com/login/oauth/authorize?client_id=6a9e16a8ed59f8e33d0e&redirect_uri" + redirectUrl;
            try {
                response.sendRedirect(codeUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("得到的验证码" + code);
        ObjectMapper objectMapper = new ObjectMapper();
        CloseableHttpClient client = HttpClients.createDefault();
        ArrayList<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("client_id", "6a9e16a8ed59f8e33d0e"));
        params.add(new BasicNameValuePair("client_secret", "47692c12a5e34c72e6df0f49ecddb2b18d8589f0"));
        params.add(new BasicNameValuePair("code", code));
        params.add(new BasicNameValuePair("redirect_uri", redirectUrl));
        UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(params, "utf-8");
        HttpPost httpPost = new HttpPost("https://github.com/login/oauth/access_token");
        httpPost.setEntity(urlEncodedFormEntity);
        httpPost.setHeader("Accept", "application/json");
        CloseableHttpResponse response1 = client.execute(httpPost);
        if (response1.getStatusLine().getStatusCode() == 200) {
            HttpEntity entity = response1.getEntity();
            String access_tokenEntity = EntityUtils.toString(entity, "utf-8");
            Map map = objectMapper.readValue(access_tokenEntity, Map.class);
            String access_token = (String) map.get("access_token");
            HttpGet httpGet = new HttpGet("https://api.github.com/user");
            httpGet.setHeader("Authorization", "token " + access_token);
            CloseableHttpResponse response2 = client.execute(httpGet);
            if (response2.getStatusLine().getStatusCode() == 200) {
                HttpEntity userEntity = response2.getEntity();
                String gitHub = EntityUtils.toString(userEntity);
                Map map1 = objectMapper.readValue(gitHub, Map.class);
                String openId = (String) map1.get("node_id");
                UserAuth userAuth = userAuthService.findUserAuthByOpenId(openId);
                session.setAttribute("openId", openId);
                if (userAuth == null) {
                    modelAndView.setViewName("/home/login/authPhone");
                    return modelAndView;
                }
            }
        }
        modelAndView.setViewName("/home/page/main");
        return modelAndView;
    }

    //绑定手机号
    @PostMapping("/bound")
    public ResultObject bound(@NotBlank(message = "手机号不能为空") @NotNull(message = "请输入手机号") @RequestParam("phone") String phone,
                              @RequestParam("code") String code
            , HttpSession session) {
        String openId = (String) session.getAttribute("openId");
        String SessionCode = (String) session.getAttribute("code");
        User user = new User();
        user.setPhone(phone);
        if (!ValidatorUtil.checkPhone(phone)) {
            return new ResultObject(0, "手机号不符合规则");
        }
        if (!StringUtils.equals(code, SessionCode)) {
            return new ResultObject(0, "验证码错误");
        }
        int result = userAuthService.addUserAndUserAuth(user, openId);
        if (result == 0) {
            return new ResultObject(0, "绑定失败");
        }
        User user1 = userService.findUser(user);
        session.setAttribute("userId", user1.getId());
        return new ResultObject(1, "绑定成功");
    }


    @GetMapping("/authGitHub")
    public ModelAndView gitHub(HttpServletResponse response,
                               ModelAndView modelAndView,
                               HttpSession session,
                               @RequestParam(value = "code", required = false) String code
            , @SessionAttribute("userId") Long userId) throws IOException {
        //先得到code
        String redirectUrl = "http://7cj8fb.natappfree.cc/oauth/authGitHub?status=" + userId;
        if (StringUtils.isBlank(code)) {
            String codeUrl = "https://github.com/login/oauth/authorize?client_id=47bb50f3246c9ecad7b6&redirect_uri" + redirectUrl;
            try {
                response.sendRedirect(codeUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("得到的验证码" + code);
        ObjectMapper objectMapper = new ObjectMapper();
        CloseableHttpClient client = HttpClients.createDefault();
        ArrayList<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("client_id", "47bb50f3246c9ecad7b6"));
        params.add(new BasicNameValuePair("client_secret", "b5226899806f6b3e3b95967563a51a20cf06da0d"));
        params.add(new BasicNameValuePair("code", code));
        params.add(new BasicNameValuePair("redirect_uri", redirectUrl));
        UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(params, "utf-8");
        HttpPost httpPost = new HttpPost("https://github.com/login/oauth/access_token");
        httpPost.setEntity(urlEncodedFormEntity);
        httpPost.setHeader("Accept", "application/json");
        CloseableHttpResponse response1 = client.execute(httpPost);
        if (response1.getStatusLine().getStatusCode() == 200) {
            System.out.println("post---------------");
            HttpEntity entity = response1.getEntity();
            String access_tokenEntity = EntityUtils.toString(entity, "utf-8");
            Map map = objectMapper.readValue(access_tokenEntity, Map.class);
            String access_token = (String) map.get("access_token");
            HttpGet httpGet = new HttpGet("https://api.github.com/user");
            httpGet.setHeader("Authorization", "token " + access_token);
            CloseableHttpResponse response2 = client.execute(httpGet);
            if (response2.getStatusLine().getStatusCode() == 200) {
                System.out.println("GET---------------");
                HttpEntity userEntity = response2.getEntity();
                String gitHub = EntityUtils.toString(userEntity);
                Map map1 = objectMapper.readValue(gitHub, Map.class);
                String openId = (String) map1.get("node_id");
                UserAuth userAuth = new UserAuth();
                System.out.println("用户id" + userId);
                userAuth.setUserId(userId);
                userAuth.setOpenId(openId);
                userAuth.setWay(WayEnum.GITHUB);
                userAuthService.addUserAuth(userAuth);
                session.setAttribute("openId", openId);
            }
        }
        modelAndView.setViewName("/home/page/main");
        return modelAndView;
    }

    @GetMapping("/wx")
    public void wxLogin(HttpServletResponse response) throws IOException {
        //请求获取code的回调地址
        //用线上环境的域名或者用内网穿透，不能用ip
        String callBack = "http://iijpa3.natappfree.cc/oauth/callBack";
        //请求地址
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize" +
                "?appid=" + "wx420cb05fc8b44dff" +
                "&redirect_uri=" + URLEncoder.encode(callBack) +
                "&response_type=code" +
                "&scope=snsapi_userinfo" +
                "&state=STATE#wechat_redirect";
        //重定向
        response.sendRedirect(url);
    }

    //	回调方法
    @RequestMapping("/callBack")
    public void wxCallBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        //获取access_token
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                "?appid=" + "wx420cb05fc8b44dff" +
                "&secret=" + "6f14357948575faf7f644b57b9d3a69f" +
                "&code=" + code +
                "&grant_type=authorization_code";
        String result = HttpClientUtil.doGet(url);
        System.out.println("请求获取access_token:" + result);
        //返回结果的json对象
        JSONObject resultObject = JSON.parseObject(result);
        //请求获取userInfo
        String infoUrl = "https://api.weixin.qq.com/sns/userinfo" +
                "?access_token=" + resultObject.getString("access_token") +
                "&openid=" + resultObject.getString("openid") +
                "&lang=zh_CN";
        String resultInfo = HttpClientUtil.doGet(infoUrl);
        //此时已获取到userInfo，再根据业务进行处理
        System.out.println("请求获取userInfo:" + resultInfo);
    }

}
