package com.doubles.mvcboard.upload.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.doubles.mvcboard.commons.util.UploadFileUtils;
import com.doubles.mvcboard.user.service.UserService;

@Controller
@RequestMapping("/user/img")
public class UserImageController {

    private final UserService userService;

    @Inject
    public UserImageController(UserService userService) {
        this.userService = userService;
    }

    // ?��?�� ?��로필 ?���?? 추�?
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String userImgUpload(String userId, MultipartFile userImgFile, HttpServletRequest request, HttpSession httpSession) throws Exception {

        // ?��?�� ?��로필 ?��진파?�� ?��로드 처리
        String savedUploadPath = UploadFileUtils.uploadUserImg(userImgFile, request);
        // ?��?�� ?��로필 ?��진명 ?��?��?��?��
        userService.userImgModify(userId, savedUploadPath);


        return "redirect:/user/info";
    }

    // ?��?�� ?��로필 ?���?? ?��?��
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String userImgDelete(String userId, HttpServletRequest request) throws Exception {
        // ?��?�� ?��로필 ?��진파?�� ?��?�� 처리
        // ?��?�� ?��로필 ?��진명 기본�?? �??�??
        return "redirect:/user/info";
    }

    // ?��?�� ?��로필 ?���?? �??�??
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String userImgModify(String userId, MultipartFile userImgFile, HttpServletRequest request) throws Exception {
        // ?��?�� ?��로필 ?��진파?�� ?��?��처리
        // ?��?�� ?��로필 ?��진파?�� ?��로드 처리
        // ?��?�� ?��로필 ?��진명 ?��?��?��?��
        return "redirect:/user/info";
    }


}
