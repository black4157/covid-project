package com.doubles.mvcboard.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doubles.mvcboard.user.domain.UserVO;
import com.doubles.mvcboard.user.service.UserService;

@Controller
@RequestMapping("/user/info")
public class UserInfoController {

    private final UserService userService;

    @Inject
    public UserInfoController(UserService userService) {
        this.userService = userService;
    }

    // ?��?�� ?���? ?��?���?
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String userInfo() throws Exception {

        return "/user/info";
    }

    // ?��?�� ?���? ?��?��
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String userInfoModify(UserVO userVO, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {
        boolean userPwValid = userService.isValidUserPw(userVO.getUserId(), userVO.getUserPw());
        if (!userPwValid) {
            redirectAttributes.addFlashAttribute("msg", "INVALID userPw");
            return "redirect:/user/info";
        }
        userService.userInfoModify(userVO);
        httpSession.setAttribute("login", userVO);
        redirectAttributes.addFlashAttribute("msg", "MODIFIED userInfo");
        return "redirect:/user/info";
    }

    // ?��?�� 비�?번호 �?�?
    @RequestMapping(value = "/password/modify", method = RequestMethod.POST)
    public String userPwModify(String userId, String oldUserPw, String newUserPw, RedirectAttributes redirectAttributes) throws Exception {

        // 비�?번호 ?���? ?��?��
        if (!userService.isValidUserPw(userId, oldUserPw)) {
            redirectAttributes.addFlashAttribute("msg", "INVALID userPw");
            return "redirect:/user/info";
        }

        // ?��로운 비�?번호 == ?��?�� 비�?번호
        if (userService.isValidUserPw(userId, newUserPw)) {
            redirectAttributes.addFlashAttribute("msg", "SAME userPw");
            return "redirect:/user/info";
        }

        // ?��로운 비�?번호 ?��?��?�� 처리, �?�?
        String hashedPw = BCrypt.hashpw(newUserPw, BCrypt.gensalt());
        userService.userPwModify(userId, hashedPw);
        redirectAttributes.addFlashAttribute("msg", "MODIFIED userPw");

        return "redirect:/user/info";
    }

}
