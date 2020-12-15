package com.doubles.mvcboard.upload.service;

import java.util.List;

public interface ArticleFileService {

    // ?��?�� 목록
    List<String> getArticleFiles(Integer articleNo) throws Exception;

    // ?��?�� ?��?��
    void deleteFile(String fileName, Integer articleNo) throws Exception;

}
