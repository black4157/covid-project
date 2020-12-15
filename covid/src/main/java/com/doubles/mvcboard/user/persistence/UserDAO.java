package com.doubles.mvcboard.user.persistence;

import java.util.Date;

import com.doubles.mvcboard.user.domain.LoginDTO;
import com.doubles.mvcboard.user.domain.UserVO;

public interface UserDAO {

    // 로그?�� 처리
    UserVO login(LoginDTO loginDTO) throws Exception;

    // 로그?�� ?���?? 처리
    void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

    // ?��?��?�� �??�??
    UserVO checkUserWithSessionKey(String value) throws Exception;

    // ?��?���???�� 처리
    void register(UserVO userVO) throws Exception;

    // ?��?��비�?번호
    String getUserPw(String userId) throws Exception;

    // ?��?��?���?? ?��?��처리
    void userInfoUpdate(UserVO userVO) throws Exception;

    // ?��?�� 비�?번호 ?��?��
    void userPwUpdate(String userId, String newUserPw) throws Exception;

    // ?��?�� ?��로필 ?��진파?�� ?��?��
    void userImgUpdate(String userId, String userImg) throws Exception;

}
