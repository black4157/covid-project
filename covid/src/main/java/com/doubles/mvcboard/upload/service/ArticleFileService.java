package com.doubles.mvcboard.upload.service;

import java.util.List;

public interface ArticleFileService {

    // ?åå?ùº Î™©Î°ù
    List<String> getArticleFiles(Integer articleNo) throws Exception;

    // ?åå?ùº ?Ç≠?†ú
    void deleteFile(String fileName, Integer articleNo) throws Exception;

}
