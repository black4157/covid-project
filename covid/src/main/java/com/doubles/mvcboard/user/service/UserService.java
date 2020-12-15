package com.doubles.mvcboard.user.service;

import java.util.Date;

import com.doubles.mvcboard.user.domain.LoginDTO;
import com.doubles.mvcboard.user.domain.UserVO;

public interface UserService {

    UserVO login(LoginDTO loginDTO) throws Exception;

    void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

    UserVO checkLoginBefore(String value) throws Exception;

    void register(UserVO userVO) throws Exception;

    boolean isValidUserPw(String userId, String userPw) throws Exception;

    void userInfoModify(UserVO userVO) throws Exception;

    void userPwModify(String userId, String newUserPw) throws Exception;

    void userImgModify(String userId, String userImg) throws Exception;

}
