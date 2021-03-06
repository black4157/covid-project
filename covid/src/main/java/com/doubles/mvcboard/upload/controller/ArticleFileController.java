package com.doubles.mvcboard.upload.controller;

import com.doubles.mvcboard.commons.util.UploadFileUtils;
import com.doubles.mvcboard.upload.service.ArticleFileService;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

@RestController
@RequestMapping("/article/file")
public class ArticleFileController {

    private final ArticleFileService articleFileService;

    @Inject
    public ArticleFileController(ArticleFileService articleFileService) {
        this.articleFileService = articleFileService;
    }

    // κ²μκΈ? ??Ό ?λ‘λ
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) {
        ResponseEntity<String> entity = null;
        try {
            String savedFilePath = UploadFileUtils.uploadFile(file, request);
            entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // κ²μκΈ? ??Ό μΆλ ₯
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {

        HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName); // Http ?€? ?€?  κ°?? Έ?€κΈ?
        String rootPath = UploadFileUtils.getRootPath(fileName, request); // ?λ‘λ κΈ°λ³Έκ²½λ‘ κ²½λ‘

        ResponseEntity<byte[]> entity = null;

        // ??Ό?°?΄?°, HttpHeader ? ?‘
        try (InputStream inputStream = new FileInputStream(rootPath + fileName)) {
            entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // κ²μκΈ? μ²¨λ? ??Ό λͺ©λ‘
    @RequestMapping(value = "/list/{articleNo}", method = RequestMethod.GET)
    public ResponseEntity<List<String>> getFiles(@PathVariable("articleNo") Integer articleNo) {
        ResponseEntity<List<String>> entity = null;
        try {
            List<String> fileList = articleFileService.getArticleFiles(articleNo);
            entity = new ResponseEntity<>(fileList, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // κ²μκΈ? ??Ό ?­?  : κ²μκΈ? ??±
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) {
        ResponseEntity<String> entity = null;

        try {
            UploadFileUtils.deleteFile(fileName, request);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // κ²μκΈ? ??Ό ?­?  : κ²μκΈ? ?? 
    @RequestMapping(value = "/delete/{articleNo}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(@PathVariable("articleNo") Integer articleNo,
                                             String fileName,
                                             HttpServletRequest request) {
        ResponseEntity<String> entity = null;

        try {
            UploadFileUtils.deleteFile(fileName, request);
            articleFileService.deleteFile(fileName, articleNo);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // κ²μκΈ? ??Ό ? μ²? ?­? 
    @RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
    public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]") String[] files, HttpServletRequest request) {

        if (files == null || files.length == 0)
            return new ResponseEntity<>("DELETED", HttpStatus.OK);

        ResponseEntity<String> entity = null;

        try {
            for (String fileName : files)
                UploadFileUtils.deleteFile(fileName, request);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

}
