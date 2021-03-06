package com.doubles.mvcboard.upload.persistence;

import java.util.List;

public interface ArticleFileDAO {

    // ??Ό μΆκ?
    void addFile(String fullName) throws Exception;

    // ??Ό λͺ©λ‘
    List<String> getArticleFiles(Integer articleNo) throws Exception;

    // ??Ό ?­? 
    void deleteFile(String fileName) throws Exception;

    // ??Ό ? μ²? ?­? 
    void deleteFiles(Integer articleNo) throws Exception;

    // ??Ό ?? 
    void replaceFile(String fileName, Integer articleNo) throws Exception;

    // ??Ό κ°?? κ°±μ 
    void updateFileCnt(Integer articleNo) throws Exception;

}
