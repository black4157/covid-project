package com.doubles.mvcboard.upload.persistence;

import java.util.List;

public interface ArticleFileDAO {

    // ?��?�� 추�?
    void addFile(String fullName) throws Exception;

    // ?��?�� 목록
    List<String> getArticleFiles(Integer articleNo) throws Exception;

    // ?��?�� ?��?��
    void deleteFile(String fileName) throws Exception;

    // ?��?�� ?���? ?��?��
    void deleteFiles(Integer articleNo) throws Exception;

    // ?��?�� ?��?��
    void replaceFile(String fileName, Integer articleNo) throws Exception;

    // ?��?�� �??�� 갱신
    void updateFileCnt(Integer articleNo) throws Exception;

}
