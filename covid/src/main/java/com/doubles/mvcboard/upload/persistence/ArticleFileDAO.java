package com.doubles.mvcboard.upload.persistence;

import java.util.List;

public interface ArticleFileDAO {

    // ?åå?ùº Ï∂îÍ?
    void addFile(String fullName) throws Exception;

    // ?åå?ùº Î™©Î°ù
    List<String> getArticleFiles(Integer articleNo) throws Exception;

    // ?åå?ùº ?Ç≠?†ú
    void deleteFile(String fileName) throws Exception;

    // ?åå?ùº ?†ÑÏ≤? ?Ç≠?†ú
    void deleteFiles(Integer articleNo) throws Exception;

    // ?åå?ùº ?àò?†ï
    void replaceFile(String fileName, Integer articleNo) throws Exception;

    // ?åå?ùº Í∞??àò Í∞±Ïã†
    void updateFileCnt(Integer articleNo) throws Exception;

}
