package com.doubles.mvcboard.upload.service;

import java.util.List;

public interface ArticleFileService {

    // ??ĵ ëŞİëĦ
    List<String> getArticleFiles(Integer articleNo) throws Exception;

    // ??ĵ ?­? 
    void deleteFile(String fileName, Integer articleNo) throws Exception;

}
