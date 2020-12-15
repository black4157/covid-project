package cdc.go.service;

import java.util.List;

import cdc.go.domain.DomesticVO;
import cdc.go.domain.WorldSearch;
import cdc.go.domain.WorldVO;

public interface CovidService {
	
	public List<DomesticVO> listAll() throws Exception;
	
	//추가
	public List<WorldVO> listWorld() throws Exception;
	
	//인자 추가
	public List<WorldVO> listAllWorld(WorldSearch WS) throws Exception;
	
}
