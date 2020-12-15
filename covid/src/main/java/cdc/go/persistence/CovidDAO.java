package cdc.go.persistence;

import java.util.List;

import cdc.go.domain.DomesticVO;
import cdc.go.domain.WorldSearch;
import cdc.go.domain.WorldVO;

public interface CovidDAO {
	
	public List<DomesticVO> listAll() throws Exception;
	
	//�߰�
	public List<WorldVO> listWorld() throws Exception;
	
	//�ΰ��߰�
	public List<WorldVO> listAllWorld(WorldSearch WS) throws Exception;
}
